from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import mysql.connector
import uuid
from PIL import Image
import matplotlib.pyplot as plt
import io
import numpy as np
from tensorflow.keras.models import load_model
from mysql.connector import Error

app = Flask(__name__)
CORS(app)

# Set the directory where uploaded file to save
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Setting for DB connetion 
db_config = {
    'user': 'wade',
    'password': 'password',
    'host': '192.168.2.23',
    'database': 'healthProject'
}

# Set the image size and color space
im_rows = 64
im_cols = 64
im_color = 3

# Classes and carolies information
LABELS = ["BULGOGI", "CHICKEN", "DONUT", "BAKED FISH", "KIMBAP", "RAMEN", "DUMPLING", "PIZZA", "RICE", "STEAK", "SUKIYAKI", "TTEOKBOKKI"]
CALORIES = ["588", "118", "648", "100", "200", "300", "400", "500", "200", "300", "400", "500"]
nb_classes = len(LABELS)

# import the ML model
model_path = os.path.join(os.path.dirname(__file__), 'trained_more_model.keras')
model = load_model(model_path)
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])


# Method to save the image through the DB
def insert_image_info(photo_url, origin_name, upload_name):
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    query = "INSERT INTO PHOTOS (PHOTOURL, ORIGINNAME, UPLOADNAME) VALUES (%s, %s, %s)"
    cursor.execute(query, (photo_url, origin_name, upload_name))

    connection.commit()
    photoid = cursor.lastrowid
    cursor.close()
    connection.close()
    return photoid


# Recognition of uploaded image
def check_photo(path):
    try:
        img = Image.open(path)
        img = img.resize((im_cols, im_rows))
        plt.imshow(img)
        plt.axis('off')
        #plt.show()

        x = np.asarray(img)
        x = x.reshape(-1, im_rows, im_cols, im_color)
        x = x.astype('float32') / 255.0

        pre = model.predict(x)[0]
        idx = np.argmax(pre)
        per = int(pre[idx] * 100)

        print(pre)
        print(f"This picture is {LABELS[idx]} ({per}%)")

        return LABELS[idx], per
    except Exception as e:
        print(f"Error processing image: {e}")
        return None, None


# Flask end point
@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify(result="error", message="No file part"), 400

    file = request.files['file']

    if file.filename == '':
        return jsonify(result="error", message="No selected file"), 400

    if file:
        print('Connected')

        # expectation of image
        img_bytes = io.BytesIO(file.read())
        foodname, per = check_photo(img_bytes)

        if foodname is None:
            return jsonify({"foodname": "Error", "probability": 0}), 200

        # Set the file name for saving
        origin_name = file.filename
        upload_name = f"{uuid.uuid4().hex}_{origin_name}"

        # Saving file path
        photo_path = os.path.join(app.config['UPLOAD_FOLDER'], upload_name)
        file.seek(0)
        file.save(photo_path)

        photo_url = f"uploads/{upload_name}"

        # saving in DB
        photoid = insert_image_info(photo_url, origin_name, upload_name)

        print(f"Successfully saved into DB → photoid={photoid}, Path={photo_url}")

        # return the jason response
        return jsonify({
            "foodname": foodname,
            "probability": per,
            "filename": upload_name,
            "photoid": photoid
        }), 200


if __name__ == '__main__':
    app.run('0.0.0.0', port=5000)

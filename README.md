# 🍱 Calories Cut – Web-Based Health Diary with AI Food Recognition  
🔗 [Live Demo - Calories Cut](http://132.145.108.97:8080/)

---

## 🧩 Project Overview  

**Calories Cut** is a web-based health tracking platform that helps users log their meals, analyze dietary habits, and maintain fitness goals.  
By uploading food images, users can automatically receive calorie and nutritional breakdowns thanks to a custom-trained AI model.  

The platform combines **frontend design**, **backend architecture**, and **machine learning integration** to deliver a seamless user experience for health-conscious individuals.  

---

## 🛠️ Tech Stack  

| Area | Technologies Used | 
|-----------|-----------|
| **Frontend** | JSP, HTML/CSS, JavaScript, jQuery, Webflow |
| **Backend** | Spring Boot, Spring MVC, MyBatis, JSP, Maven |
| **Database** | MySQL |
| **ML Server** | Python, Flask, TensorFlow (CNN-based model) |
| **Deployment** | Ubuntu, Oracle Cloud (OCI), Nginx, SSL, SCP, nohup, Spring Boot WAR Deployment |
| **Others** | AJAX, REST APIs, File Upload, Session Handling, Email Authentication |

---

## ✨ Core Features  

### 👤 User Features  
- Email verification-based sign-up  
- Custom goal setting: lose, maintain, or gain weight  
- Body & activity level registration  
- Login / Logout / Password reset  

### 🤖 AI-Powered Meal Logging  
- Upload meal photo → AI model classifies the food item  
- Calories and macronutrients (carbs, proteins, fats) automatically calculated  
- Food records viewable per day, with edit/delete functionality  

### 📰 News & Recipes  
- Health-related news crawling & summarization via external API  
- Healthy recipe suggestions  

### 🧾 My Page  
- Profile photo upload/change (with image storage and DB linkage)  
- View/edit user goals & food history  
- Visualized reports (includes infinite scroll implementation)  

---

## 🧠 Machine Learning Model – CNN Food Classifier  

**Custom Dataset Collection**  
- Manually crawled food images from Google  
- Manually cleaned: removed irrelevant/broken images  

**Model Training**  
- Used a CNN-based classifier with 10 food categories  
- Trained and evaluated using TensorFlow/Keras  
- Deployed using a lightweight Flask API for real-time predictions  

⚠️ **Limitations:**  
Due to limited dataset and model scope, only 10 predefined food categories are supported.  
However, the experience covered the full ML pipeline – data collection, cleaning, training, and API integration – all done independently.  

---

## ☁️ Deployment Details  

- WAR file packaged using Maven and deployed on Oracle Cloud (Ubuntu)  
- **Spring Boot server:**  
  ```bash
  nohup java -jar healthML.war --spring.profiles.active=dev > spring.log 2>&1 &
- **Spring Boot server:**
  ```bash
  nohup python3 photoDBinsert.py > flask.log 2>&1 &

  
## 🤞 Future Improvements  

- 💻 **Responsive design:** Currently PC-optimized; planned redesign using Tailwind or Webflow  
- 🍱 **Extend model classes:** Expand from 10 → 50+ food types  
- 🧩 **Additional features:** Favorites, personalized meal plans, OCR for food labels  

---

## 🖼️ Screenshots  

### 🏠 Start Page  
<img width="300" height="300" alt="Start Page" src="https://github.com/user-attachments/assets/33b8f979-2545-4ffb-994c-407f969b1e66" />

### 🧭 Main Page  
<img width="450" height="450" alt="Main Page" src="https://github.com/user-attachments/assets/10a6d772-5ead-499f-b8b9-823d19be96ae" />

### 🍳 Recipe Page  
<img width="450" height="350" alt="Recipe Page" src="https://github.com/user-attachments/assets/05326154-7beb-46d9-8d42-cb16ff23f57c" />

### 📖 Recipe Detail Page  
<img width="450" height="350" alt="Recipe Detail Page" src="https://github.com/user-attachments/assets/84e86c3f-704e-4071-96f8-6360248a5c1a" />

### 📰 News Page  
<img width="460" height="450" alt="News Page" src="https://github.com/user-attachments/assets/cc3eeaab-bc44-48ce-b626-c45a6c4267b0" />

### 🏋️ Exercise Page  
<img width="450" height="450" alt="Exercise Page" src="https://github.com/user-attachments/assets/b706f82e-e813-4afd-94dd-8dd08962e665" />

### 📔 Diary Page  
<img width="450" height="450" alt="Diary Page 1" src="https://github.com/user-attachments/assets/edf6dca2-fc73-48e1-ae53-2758b7011ae8" />  
<img width="450" height="600" alt="Diary Page 2" src="https://github.com/user-attachments/assets/7c2a4026-d3a0-487d-8bf5-b1c4cbdb0288" />

### 🧠 Machine Learning Result  
<img width="450" height="450" alt="ML Result" src="https://github.com/user-attachments/assets/075e570f-b89b-4ff5-869f-13e240ad7203" />



## 🚀 How to Run

### ⚙️ Requirements

- Java 17+
- Maven 3.8+
- MySQL 8.x
- Python 3.10+
- Flask
- Oracle Cloud (or any Ubuntu-based server)
- [Optional] IntelliJ or preferred IDE

---

### 💻 Backend – Spring Boot (WAR deployment)

1. **Clone the repository**
```bash
git clone https://github.com/humanwade/healthML.git
cd healthML
```

2. **Set your local database credentials**  
Change the information in `src/main/resources/application-dev.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/yourdb  
spring.datasource.username=yourname  
spring.datasource.password=yourpassword  
```

3. **Package as WAR**
```bash
mvn clean package
```

4. **Run locally (dev profile)**
```bash
java -jar target/healthML-0.0.1.war --spring.profiles.active=dev
```

---

### 🧠 Flask ML Server

1. **Go to Flask directory**
```bash
cd flask-api
```

2. **Install requirements**
```bash
pip install -r requirements.txt
```

3. **Run the server**
```bash
python3 photoDBinsert.py
```







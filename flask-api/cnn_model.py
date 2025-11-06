import tensorflow as tf
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Dropout, Flatten, Dense, BatchNormalization, Activation, Input, GlobalAveragePooling2D
from tensorflow.keras.models import Sequential
from tensorflow.keras.regularizers import l2

def create_model(input_shape, num_classes):
    model = Sequential()
    model.add(Input(shape=input_shape))
    
    # Maintain L2 Regularization Strength: 0.0001
    
    # 1. First Block: Enhanced with 0.25 Dropout
    model.add(Conv2D(32, kernel_size=(3, 3), padding='same', kernel_regularizer=l2(0.0001)))
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.25)) # Increased from 0.2 to 0.25
    
    # 2. Second Block: Enhanced with 0.25 Dropout
    model.add(Conv2D(64, kernel_size=(3, 3), padding='same', kernel_regularizer=l2(0.0001)))
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.25)) # Increased from 0.2 to 0.25
    
    # 3. Third Block: Enhanced with 0.25 Dropout
    model.add(Conv2D(128, kernel_size=(3, 3), padding='same', kernel_regularizer=l2(0.0001)))
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.25)) # Increased from 0.2 to 0.25
    
    model.add(GlobalAveragePooling2D()) 
    
    # Final Dense Layer Block: Reduced number of units to 64 and enhanced with 0.5 Dropout
    model.add(Dense(64, kernel_regularizer=l2(0.0001))) # Reduced from 128 to 64
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(Dropout(0.5)) # Increased from 0.3 to 0.5
    model.add(Dense(num_classes, activation='softmax'))
    
    return model

in_shape = (64, 64, 3) 
nb_classes = 12 

# modified CNN model
model = create_model(in_shape, nb_classes)

# model summary
print("print summary of modified model")
model.summary()

# Image Classification Major Project - CIFAR-10 using ResNet50

## Step 1: Install TensorFlow
```bash
!pip install tensorflow
```

## Step 2: Load CIFAR-10 Dataset and Preprocess
```python
import tensorflow as tf
from tensorflow.keras.datasets import cifar10
import numpy as np
import matplotlib.pyplot as plt

# Load CIFAR-10 data
(x_train, y_train), (x_test, y_test) = cifar10.load_data()

# Class names
class_names = ['Airplane', 'Automobile', 'Bird', 'Cat', 'Deer',
               'Dog', 'Frog', 'Horse', 'Ship', 'Truck']

# Normalize pixel values to be between 0 and 1
x_train = x_train.astype('float32') / 255.0
x_test = x_test.astype('float32') / 255.0

# Print dataset info
print(f"Training samples: {x_train.shape[0]}")
print(f"Test samples: {x_test.shape[0]}")
```

## Step 3: Data Augmentation
```python
from tensorflow.keras.preprocessing.image import ImageDataGenerator

# Define data augmentation
datagen = ImageDataGenerator(
    rotation_range=15,
    width_shift_range=0.1,
    height_shift_range=0.1,
    horizontal_flip=True,
)
datagen.fit(x_train)
```

## Step 4: Build the Model (ResNet50)
```python
from tensorflow.keras.applications import ResNet50
from tensorflow.keras.layers import Dense, GlobalAveragePooling2D, Dropout
from tensorflow.keras.models import Model
from tensorflow.keras.optimizers import Adam

# Load the ResNet50 model without the top classification layer
base_model = ResNet50(weights='imagenet', include_top=False,
                      input_shape=(32,32,3))

# Freeze the base model
base_model.trainable = False

# Add custom layers
x = base_model.output
x = GlobalAveragePooling2D()(x)

# Add a fully connected layer
x = Dense(1024, activation='relu')(x)
x = Dropout(0.5)(x)

# Add the final softmax layer for 10 classes
predictions = Dense(10, activation='softmax')(x)

# Define the complete model
model = Model(inputs=base_model.input, outputs=predictions)

# Compile the model
model.compile(optimizer=Adam(learning_rate=0.0001),
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Summary of the model
model.summary()
```

## Step 5: Train the Model
```python
# Train the model
history = model.fit(datagen.flow(x_train, y_train, batch_size=64),
                    epochs=10,
                    validation_data=(x_test, y_test))
```

## Step 6: Evaluate the Model
```python
# Evaluate the model
test_loss, test_acc = model.evaluate(x_test, y_test)
print(f"Test accuracy: {test_acc:.4f}")
```

## Step 7: Visualize Predictions
```python
# Visualize Predictions
def plot_predictions(images, labels, predictions):
    plt.figure(figsize=(10, 10))
    for i in range(25):
        plt.subplot(5, 5, i + 1)
        plt.xticks([])
        plt.yticks([])
        plt.grid(False)
        plt.imshow(images[i])
        predicted_label = np.argmax(predictions[i])
        true_label = labels[i][0]
        color = 'blue' if predicted_label == true_label else 'red'
        plt.xlabel(f"{class_names[predicted_label]} ({class_names[true_label]})", color=color)
    plt.show()

# Make predictions
predictions = model.predict(x_test)

# Plot predictions for the first 25 images in the test dataset
plot_predictions(x_test[:25], y_test[:25], predictions)
```

## Step 8: Testing the Model with New Images
To test the model with your own images:

### Prepare and Preprocess the Image
```python
from tensorflow.keras.preprocessing import image
import numpy as np

# Load and preprocess a new image
def prepare_image(img_path):
    img = image.load_img(img_path, target_size=(32, 32))  # Resize image to 32x32
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)  # Add batch dimension
    img_array /= 255.0  # Normalize pixel values to [0,1]
    return img_array

# Load and predict
img_path = 'path_to_your_image.jpg'
img_array = prepare_image(img_path)
prediction = model.predict(img_array)

# Get predicted class
predicted_class = np.argmax(prediction)
print(f"Predicted class: {class_names[predicted_class]}")
```

### Data Shapes Output
The dataset shapes are as follows:
- **Training Data Shape (`x_train`)**: (50000, 32, 32, 3)
- **Training Labels Shape (`y_train`)**: (50000, 1)
- **Test Data Shape (`x_test`)**: (10000, 32, 32, 3)
- **Test Labels Shape (`y_test`)**: (10000, 1)

These shapes indicate that we have 50,000 training images and 10,000 test images, each with 32x32 pixels and 3 color channels (RGB).

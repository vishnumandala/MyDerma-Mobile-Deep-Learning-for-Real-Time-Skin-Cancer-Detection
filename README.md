# Enhanced Mobile Detection of Skin Cancer Using a Hybrid Deep Learning Approach
## ENPM809K- Fundamentals of Artificial Intelligence and Deep Learning Framework

## Overview
This project focuses on the development of a mobile application called MyDerma, which utilizes advanced deep learning models to classify skin lesions for early skin cancer detection. The goal is to offer a non-invasive diagnostic tool that enhances accessibility to dermatological services and increases awareness about skin cancer.

The project combines several state-of-the-art Deep Convolutional Neural Networks (DCNNs) — specifically InceptionV3, DenseNet201, MobileNetV2, and ResNet50 — in an ensemble approach to improve classification accuracy of skin lesions. It is designed to be deployed on mobile platforms using TensorFlow Lite, making it accessible and practical for real-world use.

## Features
- **Hybrid Deep Learning Model**: The solution integrates multiple DCNN models, including InceptionV3, DenseNet201, MobileNetV2, and ResNet50, using an ensemble technique to improve accuracy.
- **High Performance**: Achieves a test accuracy of 97.15% and a validation accuracy of 98.46% through model ensembling, surpassing traditional diagnostic accuracy.
- **Mobile Deployment**: Implements the MyDerma application, leveraging TensorFlow Lite for mobile-friendly inference, allowing end-users to classify skin lesions efficiently.
- **Data Augmentation and Transfer Learning**: Uses advanced preprocessing, including image augmentation techniques like rotation, zooming, and flipping, and fine-tunes pre-trained models to achieve high precision in classification.

## Dependencies and Libraries Used
- TensorFlow: Version 2.5.0 was used for developing and training the deep learning models.
- Keras: Integrated within TensorFlow for model creation and training.
- TensorFlow Lite: For converting the trained models to a mobile-friendly format.
- OpenCV: Version 4.5.1 for image preprocessing tasks such as resizing, normalization, and augmentation.
- Numpy: For numerical computations and handling image data.
- Matplotlib: For plotting training and validation results during model evaluation.
- Scikit-Learn: Version 0.24.2 for metrics calculation, data preprocessing, and splitting the dataset.
- Android Studio: Used for developing the mobile application interface and integrating the deep learning model.
- Flutter: Version 3.19.0 was used for creating a cross-platform mobile application that integrates with the TensorFlow Lite backend.

## Project Structure
- **Dataset**: The HAM10000 dataset (https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DBW86T), consisting of 10,000 dermatoscopic images representing seven different skin lesion types, was used. Each image was preprocessed and augmented to address the class imbalance and improve model robustness.
- **Deep Learning Models**: The following DCNN architectures were used:
  - **InceptionV3**: InceptionV3 is known for its efficient computation and multiple inception modules that enable multi-scale feature extraction. In this project, we fine-tuned the InceptionV3 model in two stages. Initially, we used a learning rate of 0.0001 to adjust the top layers, followed by a lower learning rate of 0.00001 for fine-tuning the entire model. The model's input size was set to 256x192 pixels, aligning with the pretrained requirements.
  - **DenseNet201**: DenseNet201 uses densely connected layers that facilitate enhanced feature propagation and reuse, which is crucial for intricate image analysis. We fine-tuned this model using a similar two-stage approach, starting with a learning rate of 0.0001 and reducing it to 0.00001 for complete retraining. The images were resized to 256x192 pixels for DenseNet201, and the 'relu' activation layer was used as the final feature extraction layer.
  - **MobileNetV2**: MobileNetV2 is designed for resource-efficient performance, making it suitable for mobile platforms. It employs depthwise separable convolutions to reduce computational requirements. The images were resized to 224x224 pixels, and the model was fine-tuned using an initial learning rate of 0.0001, which was reduced to 0.00001 in the final stage. The MobileNetV2 architecture allowed for efficient feature extraction while maintaining a balance between model complexity and accuracy.
  - **ResNet50**: ResNet50 leverages residual learning to facilitate deep network training without vanishing gradients. For this project, the 'conv5_block3_out' layer was adapted, and the model was retrained in two stages using learning rates of 0.0001 and 0.00001. The input images were resized to 224x224 pixels, consistent with the model's original training configuration. ResNet50 was chosen for its effectiveness in handling deep feature extraction, critical for skin lesion classification.
- **Ensemble Model**: The final model integrates the above architectures by concatenating their feature vectors, followed by a dense layer for classification. Specifically, each DCNN extracted features from the input images, and these features were passed through a Global Average Pooling layer to condense them into feature vectors. The concatenated vectors were then input into a dense layer with 512 units (ReLU activation), followed by a dropout layer with a rate of 0.5 to prevent overfitting. The final output layer was a softmax layer with 7 units to classify the lesion types. The ensemble model was optimized using the Adam optimizer and categorical cross-entropy as the loss function, with accuracy as the primary evaluation metric.
- **Mobile Application**: The MyDerma app allows users to select an image, processes it to conform to the model’s requirements, and displays diagnostic predictions in a user-friendly format. The app interface was developed using Android Studio and Flutter for a cohesive user experience. The back-end inference was conducted using TensorFlow Lite, which enabled on-device prediction, ensuring that the application was lightweight and did not require cloud connectivity.

## Methodology
- **Transfer Learning**: Pre-trained models were fine-tuned in two stages with progressively reduced learning rates to align them with the specific characteristics of the HAM10000 dataset.
- **Data Preprocessing**: Images were resized and normalized to fit the input requirements of each model. Data augmentation (rotation, zooming, etc.) was also used to increase the dataset's diversity.
- **Training and Validation** : Each model underwent rigorous training, and the ensemble architecture was designed to integrate the feature extractions from each DCNN. Metrics like accuracy, precision, recall, and F1-score were used for evaluation.
  - **Fine-Tuning Strategy**: The initial fine-tuning phase involved freezing most of the model layers and updating the top layers to align with the new dataset. Afterward, the entire network was unfrozen, and a much lower learning rate was used to refine all layers, ensuring that the pre-trained features were not lost but rather adapted to the new dataset characteristics.
  - **Data Augmentation**: Given the imbalance of lesion types in the HAM10000 dataset, we applied various data augmentation techniques, such as rotation, horizontal flipping, and zooming. This helped increase data diversity and reduce overfitting. Moreover, images were normalized to zero mean and unit variance to standardize the input data across different models.
  - **Evaluation Metrics**: In addition to accuracy, precision, recall, and F1-score were computed to provide a more comprehensive understanding of model performance, particularly with respect to the imbalanced nature of the dataset.

## Key Results
- **Ensemble Model**: Achieved a test accuracy of 97.15% and a validation accuracy of 98.46%.
- **Individual Model Performance**: Notable performances included ResNet50 with 96.84% test accuracy and DenseNet201 with 93.72% test accuracy. The ensemble model was able to leverage the strengths of each individual model, resulting in superior classification performance.
- **Mobile Application**: The MyDerma application demonstrated effective skin lesion classification during real-world testing, highlighting the robustness of the model in practical conditions.

## Limitations
- **Dataset Bias**: The model's performance heavily relies on the diversity of the HAM10000 dataset, which may not cover all skin lesion variations, especially rare types.
- **Mobile Deployment**: The accuracy may vary due to external factors like camera quality, lighting conditions, and device computational limits.
- **Training Limitations**: The training process was limited to 20-25 epochs due to computational constraints, which could be extended for improved results.

## Demonstration
![](https://github.com/vishnumandala/Enhanced-Mobile-Detection-of-Skin-Cancer-Project/blob/main/demonstration.gif)

## Resources
- The application files can be viewed on: https://umd0-my.sharepoint.com/:f:/g/personal/vishnum_umd_edu/EovZxgjBUXhGnDsvVNqQp9EBNnOJRpBaJHsQUjVO57QyXw?e=q70DmZ

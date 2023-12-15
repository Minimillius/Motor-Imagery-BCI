
# Motor Imagery Classifier

This repository contains MATLAB code for a Motor Imagery Classifier that sequentially processes EEG data for accurate classification. The application requires the Biosig Toolbox for signal processing functionalities. Ensure that the Biosig Toolbox is installed before running the code.

## 1. Data Preprocessing

### Butterworth Filter
The initial step involves filtering the EEG data using a Butterworth filter in the Beta and Mu frequency bands. This step enhances the relevant signal components for motor imagery classification.

## 2. Data Splitting - K Fold Cross-Validation

To assess the classifier's performance robustly, a K Fold Cross-Validation method is employed for splitting the dataset into training and testing sets. This ensures reliable evaluation and prevents overfitting.

## 3. Common Spatial Pattern (CSP)

The Common Spatial Pattern algorithm is applied to enhance the discriminatory features in the EEG data. CSP optimally extracts spatial filters to maximize the variance between different motor imagery classes, improving the classifier's accuracy.

## 4. Feature Extraction

The repository implements feature extraction techniques to distill essential information from the preprocessed EEG data. These features serve as input for the final classification stage.

## 5. Support Vector Machine (SVM) Classification

The classification process utilizes a Support Vector Machine (SVM) algorithm. The SVM is trained on the extracted features, effectively distinguishing between different motor imagery classes.

### How It Works

1. **Data Enhancement:** The Butterworth filter refines EEG data.
2. **Robust Evaluation:** K Fold Cross-Validation ensures reliable model assessment.
3. **Discriminatory Feature Enhancement:** Common Spatial Pattern improves feature extraction.
4. **Feature Distillation:** Extracted features are used for SVM classification.
5. **Accurate Classification:** The SVM accurately classifies motor imagery.

Ensure the Biosig Toolbox is installed before running the code. Feel free to explore the codebase for detailed implementation and customization options. For specific instructions on running the code, refer to the documentation within each module.

## Getting Started

Follow these steps to get started with the Motor Imagery Classifier:

1. Clone the repository to your local machine.
2. Install the Biosig Toolbox (refer to [Biosig Toolbox Installation](https://biosig.sourceforge.io/)).
3. Open MATLAB and navigate to the repository folder.
4. Run the main script to execute the complete classification pipeline.

For detailed information on each function, refer to the in-code comments and documentation.

## Author

- Hamid Darvishi

Please report any issues or problems to <Hamid.R.Darvishi@Hotmail.com>

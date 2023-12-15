# Examples

Explore the following examples to understand how to use the Motor Imagery Classifier for EEG data classification:

## Example 1: Basic Usage

In this example, we demonstrate the basic usage of the Motor Imagery Classifier on a sample dataset. Open MATLAB and run the `main.m` script with default parameters:

```matlab
main.m
```

This will execute the entire classification pipeline on the provided sample data, showcasing the sequence of data preprocessing, feature extraction, and SVM classification.

## Example 2: Custom Dataset

If you have your own EEG dataset, follow these steps to integrate it into the Motor Imagery Classifier:

1. Place your dataset in the `dataset` directory.
2. Modify the `main.m` script to load your dataset and configure parameters accordingly.
3. Run the modified `main.m` script:

    ```matlab
    main.m
    ```

This example demonstrates the flexibility of the Motor Imagery Classifier in handling custom datasets.

## Example 3: Parameter Tuning

Adjust classifier parameters in the `main.m` script to observe the impact on classification performance. Experiment with different filter settings, CSP parameters, and SVM configurations to optimize the classifier for your specific use case.

```matlab
% Modify parameters in Main.m script
order = 4;
fl    = 8;
fh    = 30;
svmKernel = 'linear';

% Run the modified script
main.m
```

This example showcases how parameter tuning can enhance the classifier's accuracy.

## Example 4: Integration with Existing Workflow

Integrate the Motor Imagery Classifier into your existing MATLAB workflow by incorporating the relevant functions into your scripts. Customize the pipeline to seamlessly fit into your EEG data processing pipeline.

```matlab
% Your existing code
% ...

% Include Motor Imagery Classifier functions
addpath('path/to/motor-imagery-BCI');

% Modify the script to call relevant functions
% ...

% Run the integrated script
main.m
```

This example illustrates how to incorporate the Motor Imagery Classifier into a broader EEG data analysis workflow.

Experiment with different datasets, configurations, and integration options to adapt the Motor Imagery Classifier to your specific needs.

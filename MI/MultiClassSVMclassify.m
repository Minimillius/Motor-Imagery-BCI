function output = MultiClassSVMclassify(mdl, datatest)
    numClasses = numel(mdl);

    output = nan(1, size(datatest, 2));

    for i = 1:numClasses
        classIndices = svmclassify(mdl(i).svm, datatest');
        output(classIndices == 1) = i;
    end
end

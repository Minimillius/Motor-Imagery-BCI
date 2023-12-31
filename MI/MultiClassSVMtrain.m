function mdl = MultiClassSVMtrain(featuretrain1, featuretrain2, featuretrain3, featuretrain4)
    numClasses = 4;
    mdl = struct('svm', cell(1, numClasses));

    for i = 1:numClasses
        data1 = eval(['featuretrain', num2str(i)]);
        data2 = cat(2, eval(['featuretrain', num2str(setdiff(1:numClasses, i))]));

        datatrain  = [data1, data2];
        labeltrain = [ones(1, size(data1, 2)), 2 * ones(1, size(data2, 2))];
        mdl(i).svm = svmtrain(datatrain', labeltrain);
    end
end

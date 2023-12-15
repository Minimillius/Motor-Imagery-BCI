function [mdl] = MultiClassSVMtrain(featuretrain1,featuretrain2,featuretrain3,featuretrain4)

%% 1 versus 2 3 4
data1 = featuretrain1;
data2 = cat(2,featuretrain2,featuretrain3,featuretrain4);

datatrain  = [data1,data2];
labeltrain = [ones(1,size(data1,2)),2*ones(1,size(data2,2))];
mdl.svm1   = svmtrain(datatrain',labeltrain);

%% 2 versus 1 3 4
data1 = featuretrain2;
data2 = cat(2,featuretrain1,featuretrain3,featuretrain4);
datatrain  = [data1,data2];
labeltrain = [ones(1,size(data1,2)),2*ones(1,size(data2,2))];
mdl.svm2   = svmtrain(datatrain',labeltrain);

%% 3 versus 1 2 4
data1 = featuretrain3;
data2 = cat(2,featuretrain1,featuretrain2,featuretrain4);
datatrain  =[data1,data2];
labeltrain = [ones(1,size(data1,2)),2*ones(1,size(data2,2))];
mdl.svm3   = svmtrain(datatrain',labeltrain);

%% 4 versus 1 2 3
data1 = featuretrain4;
data2 = cat(2,featuretrain1,featuretrain2,featuretrain3);
datatrain  = [data1,data2];
labeltrain = [ones(1,size(data1,2)),2*ones(1,size(data2,2))];
mdl.svm4   = svmtrain(datatrain',labeltrain);

end
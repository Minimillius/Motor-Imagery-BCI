clc
clear
close all
%%biosig signal load
filename = ['dataset\A09T.gdf'];
[s,h] = sload(filename);
fs    = 250;

%% remove missing value
indx    = find( isnan(s));
s(indx) = 0;

%% band pass filtering to extract mu and beta rythms from original eeg signal
order = 3;  %Butterworh filter order
fl    = 8;  %Low cutoff frequency
fh    = 30; %High cutoff frequency
wn    = [fl fh] / (fs/2); %normalised cutoff frequency vector
type  = 'bandpass';
[b,a] = butter(order, wn, type);
s     = filtfilt(b, a, s(:, 1:22)); %implementation of two consequtive filter to eleviate the time shift

%%
group    = h.EVENT.TYP;
pos      = h.EVENT.POS;
duration = h.EVENT.DUR;
c1 = 0;
c2 = 0;
c3 = 0;
c4 = 0;

for i = 1:length(group) %Data segmentation for every different class 
    ind   = pos(i): pos(i) + duration(i)-1;
    trial = s(ind, :);
    if     group(i) == 769
        c1 = c1+1;
        data1(:, :, c1) = trial;

    elseif group(i) == 770
        c2 = c2+1;
        data2(:, :, c2) = trial;

    elseif group(i) == 771
        c3 = c3+1;
        data3(:, :, c3) = trial;

    elseif group(i) == 772
        c4 = c4+1;
        data4(:, :, c4) = trial;
    end
end

k = 6;              %K-fold method preparation 
fold1 = floor(size(data1, 3) / k);
fold2 = floor(size(data2, 3) / k);
fold3 = floor(size(data3, 3) / k);
fold4 = floor(size(data4, 3) / k);
C = 0;

for iter = 1:k      %K-fold method implementation
    indtest1 = (iter-1)* fold1+1: iter*fold1;   %indexes for each fold of class 1 test data
    indtest2 = (iter-1)* fold2+1: iter*fold2;   %indexes for each fold of class 2 test data
    indtest3 = (iter-1)* fold3+1: iter*fold3;   %indexes for each fold of class 3 test data
    indtest4 = (iter-1)* fold4+1: iter*fold4;   %indexes for each fold of class 4 test data
    
    indtrain1 = 1:size(data1, 3);   %select whole class data
    indtrain2 = 1:size(data2, 3);
    indtrain3 = 1:size(data3, 3);
    indtrain4 = 1:size(data4, 3);
    
    indtrain1(indtest1) = [];       %empty the test section to creat train indexes      
    indtrain2(indtest2) = [];
    indtrain3(indtest3) = [];
    indtrain4(indtest4) = [];
    
    datatrain1 = data1(:, :, indtrain1);    %selecting the train data from selected indexes
    datatrain2 = data2(:, :, indtrain2);
    datatrain3 = data3(:, :, indtrain3);
    datatrain4 = data4(:, :, indtrain4);
    
    datatest1 = data1(:, :, indtest1);      %selecting the test data from selected indexes
    datatest2 = data2(:, :, indtest2);
    datatest3 = data3(:, :, indtest3);
    datatest4 = data4(:, :, indtest4);

    [w2] = myMulticClassCSP2(datatrain1, datatrain2, datatrain3, datatrain4, 4); %CSP implementation for One VS other
    [w1] = myMulticClassCSP1(datatrain1, datatrain2, datatrain3, datatrain4, 4); %CSP implementation for One VS rest
    w = cat(3, w1, w2); %concatenate CSP coefficients in third dim
   
    for i = 1:size(datatrain1, 3) %feature extraction of train data for each class
        x1   = datatrain1(:, :, i)';
        [f1] = myfeatureExtraction(x1, w);
        featuretrain1(:, i) = f1;
        
        x2   = datatrain2(:, :, i)';
        [f2] = myfeatureExtraction(x2, w);
        featuretrain2(:, i) = f2;
        
        x3   = datatrain3(:, :, i)';
        [f3] = myfeatureExtraction(x3, w);
        featuretrain3(:, i) = f3;
        
        x4   = datatrain4(:, :, i)';
        [f4] = myfeatureExtraction(x4, w);
        featuretrain4(:, i) = f4;
    end
    
    for i = 1:size(datatest1,3) %feature extraction of test data for each class
        x1   = datatest1(:, :, i)';
        [f1] = myfeatureExtraction(x1, w);
        featuretest1(:, i) = f1;
        
        x2   = datatest2(:, :, i)';
        [f2] = myfeatureExtraction(x2, w);
        featuretest2(:, i) = f2;
        
        x3   = datatest3(:, :, i)';
        [f3] = myfeatureExtraction(x3, w);
        featuretest3(:, i) = f3;
        
        x4   = datatest4(:, :, i)';
        [f4] = myfeatureExtraction(x4, w);
        featuretest4(:, i) = f4;
    end
    
    testdata  = [featuretest1, featuretest2, featuretest3, featuretest4];
    testlabel = [ones(1, size(featuretest1, 2)),...
        2*ones(1, size(featuretest2, 2)),...
        3*ones(1, size(featuretest3, 2)),...
        4*ones(1, size(featuretest4, 2))];
    
    %% train classifier using train data and label
    [mdl] = MultiClassSVMtrain(featuretrain1, featuretrain2, featuretrain3, featuretrain4);

    %% test tained classifir using test data
    [output] = MultiClassSVMclassify(mdl, testdata);
    C = C + confusionmat(testlabel, output);
    
    disp(['iteration: ',num2str(iter)])
end
%% accuracy calculation
accuracy  = sum(diag(C)) / sum(C(:)) *100;  
accuracy1 = C(1,1) / sum(C(1,:)) *100;
accuracy2 = C(2,2) / sum(C(2,:)) *100;
accuracy3 = C(3,3) / sum(C(3,:)) *100;
accuracy4 = C(4,4) / sum(C(4,:)) *100;
disp(['total Accuracy: ', num2str(accuracy),' %']) %Conf matrix 
disp([' Accuracy1: ', num2str(accuracy1),' %'])
disp([' Accuracy2: ', num2str(accuracy2),' %'])
disp([' Accuracy3: ', num2str(accuracy3),' %'])
disp([' Accuracy4: ', num2str(accuracy4),' %'])







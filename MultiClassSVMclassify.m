function [output] = MultiClassSVMclassify(mdl,datatest)

for i = 1:size(datatest,2)
    x = datatest(:,i);
    y = svmclassify(mdl.svm1,x');
    if y == 1
        output(i) = 1;
    elseif y ==2 
        y = svmclassify(mdl.svm2,x');
        if y == 1
            output(i) =2 ;
        elseif y == 2
            y = svmclassify(mdl.svm3,x');
            if y == 1
                output(i) = 3;
            elseif y == 2
                y = svmclassify(mdl.svm4,x');
                if y == 1
                    output(i) =4 ;
                elseif y == 2
                    output(i) = nan;
                end
            end
        end
    end
end
end
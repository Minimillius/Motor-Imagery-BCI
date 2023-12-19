function [f] = myfeatureExtraction(x,w);

for i = 1:size(w,3)
    y = w(:,:,i)' *x;
    temp(:,i) = log10(var(y') / sum(var(y')));
end
f = temp(:);
end
function [w] = myCSP(data1,data2,m)
%
Rh = 0;
for i  = 1:size(data1,3)
    x1 = data1(:,:,i)';
    % step 1: normal data
    for n = 1:size(x1,1)
        x1(n,:) = x1(n,:) - mean(x1(n,:));
    end
    % step 1: normal data
    rh = (x1*x1')/trace((x1*x1'));
    Rh = Rh+ rh;
end
% step2: calculate Rh and Rf mean
Rh = Rh / size(data1,3);
%
Rf = 0;
for i  = 1:size(data2,3)
    x2 = data2(:,:,i)';
    % step 1: normal data
    for n = 1:size(x2,1)
        x2(n,:) = x2(n,:) - mean(x2(n,:));
    end
    % step 1: normal data
    rf = (x2*x2')/trace((x2*x2'));
    Rf = Rf+ rf;
end
% step2: calculate Rh and Rf mean
Rf = Rf / size(data2,3);

%% step 3: generalized eigen value decomposition
[u,v] = eig(Rh,Rf);
v = diag(v);
[v,ind] = sort(v,'descend');
u = u(:,ind);
w = [u(:,1:m) , u(:,end-m+1:end) ];

end


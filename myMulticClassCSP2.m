function [w] = myMulticClassCSP2(datatrain1, datatrain2, datatrain3, datatrain4, m)

%% 1 versus 2 
data1 = datatrain1;
data2 = datatrain2;
[w12] = myCSP(data1, data2, m);

%% 1 versus 3 
data1 = datatrain1;
data2 = datatrain3;
[w13] = myCSP(data1, data2, m);

%% 1 versus 4 
data1 = datatrain1;
data2 = datatrain4;
[w14] = myCSP(data1, data2, m);

%% 2 versus 3 
data1 = datatrain2;
data2 = datatrain3;
[w23] = myCSP(data1, data2, m);

%% 2 versus 4 
data1 = datatrain2;
data2 = datatrain4;
[w24] = myCSP(data1, data2, m);

%% 3 versus 4 
data1 = datatrain3;
data2 = datatrain4;
[w34] = myCSP(data1, data2, m);

w = cat(3, w12, w13, w14, w23, w24, w34);

end
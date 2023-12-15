function [w] = myMulticClassCSP1(datatrain1,datatrain2,datatrain3,datatrain4,m)

%% 1 versus 2 3 4
data1 = datatrain1;
data2 = cat(3,datatrain2,datatrain3,datatrain4);
[w1]  = myCSP(data1,data2,m);

%% 2 versus 1 3 4
data1 = datatrain2;
data2 = cat(3,datatrain1,datatrain3,datatrain4);
[w2]  = myCSP(data1,data2,m);

%% 3 versus 1 2 4
data1 = datatrain3;
data2 = cat(3,datatrain1,datatrain2,datatrain4);
[w3]  = myCSP(data1,data2,m);

%% 4 versus 1 2 3
data1 = datatrain4;
data2 = cat(3,datatrain1,datatrain2,datatrain3);
[w4]  = myCSP(data1,data2,m);

w = cat(3,w1,w2,w3,w4);

end
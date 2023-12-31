function w = myMulticClassCSP1(datatrain1, datatrain2, datatrain3, datatrain4, m)
    w1 = myCSP(datatrain1, cat(3, datatrain2, datatrain3, datatrain4), m);
    w2 = myCSP(datatrain2, cat(3, datatrain1, datatrain3, datatrain4), m);
    w3 = myCSP(datatrain3, cat(3, datatrain1, datatrain2, datatrain4), m);
    w4 = myCSP(datatrain4, cat(3, datatrain1, datatrain2, datatrain3), m);

    w = cat(3, w1, w2, w3, w4);
end

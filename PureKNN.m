function [KNNG] = PureKNN(Data, Label)
    disp('K-nearest Neghbour');
    KNNG.k = 9;        KNNG.tau = 1;
    [KNNG.missrate, KNNG.grps, KNNG.CKSym] = KNNG_UOPCA(normc(Data), KNNG.k, KNNG.tau, Label);
end
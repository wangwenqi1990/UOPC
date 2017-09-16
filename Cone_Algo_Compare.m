function [SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
    NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
    KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
    KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
    TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20] = Cone_Algo_Compare(Data, Label)
    %%
    % addpath /Users/wenqiwang/Documents/cvx; cvx_startup; cvx_setup;
    % Data given is unormalized data;
    % SSC and NCL applies on unormalized data while KNN-SC appies on
    % normalized data.
    addpath SSC_ADMM_v1.1
    
    %%  0:  SSC Algorithm (Know the clusters before hand, embeded in the SSC function)
    disp('Sparse Subspace Clustering 0');
    SSCO0.r = 0;     SSCO0.affine = false;    SSCO0.outlier = true; 
    SSCO0.rho = 1;   SSCO0.alpha = 0.000001;
    [SSCO0.missrate,~, SSCO0.grps, ~, SSCO0.time] = SSC(Data,SSCO0.r,SSCO0.affine,SSCO0.alpha,SSCO0.outlier,SSCO0.rho,Label);
    
    %  .02:  SSC Algorithm (Know the clusters before hand, embeded in the SSC function)
    disp('Sparse Subspace Clustering .02');
    SSCO002.r = 0;     SSCO002.affine = false;    SSCO002.outlier = true; 
    SSCO002.rho = 1;   SSCO002.alpha = .02;
    [SSCO002.missrate,~, SSCO002.grps, ~, SSCO002.time] = SSC(Data,SSCO002.r,SSCO002.affine,SSCO002.alpha,SSCO002.outlier,SSCO002.rho,Label);
    
    %  .2:  SSC Algorithm (Know the clusters before hand, embeded in the SSC function)
    disp('Sparse Subspace Clustering .2');
    SSCO02.r = 0;     SSCO02.affine = false;    SSCO02.outlier = true; 
    SSCO02.rho = 1;   SSCO02.alpha = .2;
    [SSCO02.missrate,~, SSCO02.grps, ~, SSCO02.time] = SSC(Data,SSCO02.r,SSCO02.affine,SSCO02.alpha,SSCO02.outlier,SSCO02.rho,Label);
    
    %  2:  SSC Algorithm (Know the clusters before hand, embeded in the SSC function)
    disp('Sparse Subspace Clustering 2');
    SSCO2.r = 0;     SSCO2.affine = false;    SSCO2.outlier = true; 
    SSCO2.rho = 1;   SSCO2.alpha = 2;
    [SSCO2.missrate,~, SSCO2.grps, ~, SSCO2.time] = SSC(Data,SSCO2.r,SSCO2.affine,SSCO2.alpha,SSCO2.outlier,SSCO2.rho,Label);
    
    %  20: SSC Algorithm (Know the clusters before hand, embeded in the SSC function)
    disp('Sparse Subspace Clustering 20');
    SSCO20.r = 0;     SSCO20.affine = false;    SSCO20.outlier = true; 
    SSCO20.rho = 1;   SSCO20.alpha = 20;
    [SSCO20.missrate,~, SSCO20.grps, ~, SSCO20.time] = SSC(Data,SSCO20.r,SSCO20.affine,SSCO20.alpha,SSCO20.outlier,SSCO20.rho,Label);
    
    %  200:  SSC Algorithm (Know the clusters before hand, embeded in the SSC function)
    disp('Sparse Subspace Clustering 200');
    SSCO200.r = 0;     SSCO200.affine = false;    SSCO200.outlier = true; 
    SSCO200.rho = 1;   SSCO200.alpha = 200;
    [SSCO200.missrate,~, SSCO200.grps, ~, SSCO200.time] = SSC(Data,SSCO200.r,SSCO200.affine,SSCO200.alpha,SSCO200.outlier,SSCO200.rho,Label);
    
    %%  KNN (Know the number of clusters before hand): normalized data to do polyhedral cone clustering
    %   Data = [randn(2,100), 4+randn(2, 100)]; Label = [ones(1, 100), 2 * ones(1, 100)];
    disp('2-nearest Neghbour');
    KNNG2.k = 2;        KNNG2.tau = 1;
    [KNNG2.missrate, KNNG2.grps, ~, KNNG2.time] = KNNG_UOPCA(normc(Data), KNNG2.k, KNNG2.tau, Label);
    
    disp('4-nearest Neghbour');
    KNNG4.k = 4;        KNNG4.tau = 1;
    [KNNG4.missrate, KNNG4.grps, ~, KNNG4.time] = KNNG_UOPCA(normc(Data), KNNG4.k, KNNG4.tau, Label);
    
    disp('6-nearest Neghbour');
    KNNG6.k = 6;        KNNG6.tau = 1;
    [KNNG6.missrate, KNNG6.grps, ~, KNNG6.time] = KNNG_UOPCA(normc(Data), KNNG6.k, KNNG6.tau, Label);
    
    disp('8-nearest Neghbour');
    KNNG8.k = 8;        KNNG8.tau = 1;
    [KNNG8.missrate, KNNG8.grps, ~, KNNG8.time] = KNNG_UOPCA(normc(Data), KNNG8.k, KNNG8.tau, Label);
    
    disp('10-nearest Neghbour');
    KNNG10.k = 10;        KNNG10.tau = 1;
    [KNNG10.missrate, KNNG10.grps, ~, KNNG10.time] = KNNG_UOPCA(normc(Data), KNNG10.k, KNNG10.tau, Label);
    
    disp('12-nearest Neghbour');
    KNNG12.k = 12;        KNNG12.tau = 1;
    [KNNG12.missrate, KNNG12.grps, ~, KNNG12.time] = KNNG_UOPCA(normc(Data), KNNG12.k, KNNG12.tau, Label);
    
    disp('14-nearest Neghbour');
    KNNG14.k = 14;        KNNG14.tau = 1;
    [KNNG14.missrate, KNNG14.grps, ~,  KNNG14.time] = KNNG_UOPCA(normc(Data), KNNG14.k, KNNG14.tau, Label);
    
    disp('16-nearest Neghbour');
    KNNG16.k = 16;        KNNG16.tau = 1;
    [KNNG16.missrate, KNNG16.grps, ~, KNNG16.time] = KNNG_UOPCA(normc(Data), KNNG16.k, KNNG16.tau, Label);
    
    %%
    %  Mutual KNN-SC
    disp('2-nearest Mutual Neghbour');
    KNN_M2.k = 2;        KNN_M2.tau = 1;
    [KNN_M2.missrate, KNN_M2.grps, ~, KNN_M2.time] = KNNG_M(normc(Data), KNN_M2.k, KNN_M2.tau, Label);
    
    disp('4-nearest Mutual Neghbour');
    KNN_M4.k = 4;        KNN_M4.tau = 1;
    [KNN_M4.missrate, KNN_M4.grps, ~, KNN_M4.time] = KNNG_M(normc(Data), KNN_M4.k, KNN_M4.tau, Label);
    
    disp('6-nearest Mutual Neghbour');
    KNN_M6.k = 6;        KNN_M6.tau = 1;
    [KNN_M6.missrate, KNN_M6.grps, ~, KNN_M6.time] = KNNG_M(normc(Data), KNN_M6.k, KNN_M6.tau, Label);
    
    disp('8-nearest Mutual Neghbour');
    KNN_M8.k = 8;        KNN_M8.tau = 1;
    [KNN_M8.missrate, KNN_M8.grps, ~, KNN_M8.time] = KNNG_M(normc(Data), KNN_M8.k, KNN_M8.tau, Label);
    
    disp('10-nearest Mutual Neghbour');
    KNN_M10.k = 10;        KNN_M10.tau = 1;
    [KNN_M10.missrate, KNN_M10.grps, ~, KNN_M10.time] = KNNG_M(normc(Data), KNN_M10.k, KNN_M10.tau, Label);    

    disp('12-nearest Mutual Neghbour');
    KNN_M12.k = 12;        KNN_M12.tau = 1;
    [KNN_M12.missrate, KNN_M12.grps, ~, KNN_M12.time] = KNNG_M(normc(Data), KNN_M12.k, KNN_M12.tau, Label);
    
    disp('14-nearest Mutual Neghbour');
    KNN_M14.k = 14;        KNN_M14.tau = 1;
    [KNN_M14.missrate, KNN_M14.grps, ~, KNN_M14.time] = KNNG_M(normc(Data), KNN_M14.k, KNN_M14.tau, Label);
    
    disp('16-nearest Mutual Neghbour');
    KNN_M16.k = 16;        KNN_M16.tau = 1;
    [KNN_M16.missrate, KNN_M16.grps, ~, KNN_M16.time] = KNNG_M(normc(Data), KNN_M16.k, KNN_M16.tau, Label);
    
    
    
    %%
    %  NCL (Know the number of clusters)
    disp('NCL: lambda = 0');
    NCL0.lambda =0;
    [NCL0.missrate, NCL0.grps, ~, NCL0.time ] = NCL_UOPC( Data,  NCL0.lambda, Label);
    
    %  NCL 0.02
    disp('NCL: lambda = 0.02');
    NCL002.lambda =0.02;
    [NCL002.missrate, NCL002.grps, ~, NCL002.time] = NCL_UOPC( Data,  NCL002.lambda, Label);
    
    %  NCL 0.2
    disp('NCL: lambda = 0.2');
    NCL02.lambda =0.2;
    [NCL02.missrate, NCL02.grps, ~, NCL02.time] = NCL_UOPC( Data,  NCL02.lambda, Label);
    
    %  NCL 2
    disp('NCL: lambda = 2');
    NCL2.lambda =2;
    [NCL2.missrate, NCL2.grps, ~, NCL2.time] = NCL_UOPC( Data,  NCL2.lambda, Label);
    
    %  NCL 20
    disp('NCL: lambda = 20');
    NCL20.lambda =20;
    [NCL20.missrate, NCL20.grps, ~, NCL20.time] = NCL_UOPC( Data,  NCL20.lambda, Label);
    
    %  NCL 200
    disp('NCL: lambda = 200');
    NCL200.lambda =200;
    [NCL200.missrate, NCL200.grps, ~, NCL200.time] = NCL_UOPC( Data,  NCL200.lambda, Label);
    
    %%
    % TSC algorithm
    disp('TSC algorithm 5');
    TSC_Algo5.q = 5;
    [TSC_Algo5.missrate, TSC_Algo5.grps,~,TSC_Algo5.CPUtime] = TSC_Update(Data, TSC_Algo5.q,Label);
    
    disp('TSC algorithm 10');
    TSC_Algo10.q = 10;
    [TSC_Algo10.missrate, TSC_Algo10.grps,~,TSC_Algo10.CPUtime] = TSC_Update(Data, TSC_Algo10.q,Label);
    
    disp('TSC algorithm 15');
    TSC_Algo15.q = 15;
    [TSC_Algo15.missrate, TSC_Algo15.grps,~,TSC_Algo15.CPUtime] = TSC_Update(Data, TSC_Algo15.q,Label);
    
    disp('TSC algorithm 20');
    TSC_Algo20.q = 20;
    [TSC_Algo20.missrate, TSC_Algo20.grps,~, TSC_Algo20.CPUtime] = TSC_Update(Data, TSC_Algo20.q,Label);
    
end
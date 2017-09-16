function [missrate, grps, CKSym, CPUtime] = NCL_UOPC( Data,  lambda, Label)
    
    start = cputime;
    % number of data
    N  = size(Data,2);
    
    % number of cluster
    n = max(Label);
    
    AMat = zeros(N,N);
    
    
    for i=1:N
        y = Data(:, i);
        indx = setdiff(1:N, i);
        Y = Data(:, indx);
        I=ones(N-1,1);
        
        cvx_solver Mosek 
        cvx_begin quiet; 
            cvx_precision high
            variable c(N-1,1);
            minimize( lambda * I' * c +0.5 * sum_square( (y - Y*c) )  );
            subject to
                c >= 0;
        cvx_end;
        
        AMat(i, indx) = c';
    end
    
    CKSym = BuildAdjacency(AMat,0);
    
    % Spectral Clustering
    grps = SpectralClustering(CKSym,n);
    grps = bestMap(Label,grps);
    missrate = Misclassification(grps, Label);
    CPUtime = cputime - start;

end
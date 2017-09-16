function [missrate, grps, CKSym, CPUtime] = KNNG_M(Data, k, tau, Label)
    % Data:     d * N, not normalized, if polyhedral cone, need input
    %           normalized data
    % k:        K negithbors
    % tau:      gaussian kernal parameters
    % Label:    a vector of N vectors

    start = cputime;
    % number of cluster
    n = max(Label);
    
    % number of Data
    N = size(Data, 2);
    
    % KNN gaussian kernel distance
    [idx,  dist] = knnsearch(Data',Data','k',k+1, 'dist','euclidean');
    idx  = idx(:,2:k+1);
    dist = exp(-dist(:,2:k+1).^2/(2* tau));
    
    
    % Affinity Matrix
    AMat = zeros(N, N);
    IdxMat = zeros(N, N);
    LarMat = zeros(N,N);
    for i=1:1:N
        AMat(i,idx(i,:)) = dist(i,:);
        IdxMat(i, idx(i,:)) = 1;
        LarMat(i, idx(i,1)) = 1;
        % AMat(i,:) = AMat(i,:)/sum( AMat(i,:) );
    end
    IdxMat = ((IdxMat + IdxMat')==2) | LarMat;
    AMat   = AMat .* IdxMat;
    CKSym = BuildAdjacency(AMat,0);
    
    % Spectral Clustering
    % save debug
    grps = SpectralClustering(CKSym,n);
    grps = bestMap(Label,grps);
    missrate = Misclassification(grps, Label);
    CPUtime = cputime - start;
end
# UOPC
This is the code implement for the paper

Wenqi Wang, Vaneet Aggarwal, Shuchine Aeron, Unsupervised clustering under the Union of Polyhedral Cones (UOPC) model.

The comparables are 
(1) Sparse Subspace Clustering (SSC)  
	(http://vision.jhu.edu/code/)
(2) robust subspace clustering via thresholding (TSC) 
	(https://www.nari.ee.ethz.ch/commth/research/downloads/sc.html)
(3) Non-negative Contraint Lasso (NCL), which is implemented using Mosek solver in cvx
	(http://cvxr.com/cvx/)

To replicate the reults, cvx is needed to be downloaded from (http://cvxr.com/cvx/) with Mosek (http://cvxr.com/cvx/doc/mosek.html) solver installed. 

The proposed KNN-SC algorithm is KNNG_UOPCA.m in the document.
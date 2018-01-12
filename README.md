# UOPC
Copyright @ Wenqi Wang, 2017

The proposed KNN-SC algorithm is KNNG_UOPCA.m in the document.
To replicate the reults, cvx is needed to be downloaded from (http://cvxr.com/cvx/) with Mosek (http://cvxr.com/cvx/doc/mosek.html) solver installed. 
To run the code
(1) run main_2D.m for 2 dimensional synthetic data
(2) run main_3D.m for 3 dimensional synthetic data
(3) run main_MNIST for MNIST data clustering
(4) run main_Motion for motion data clustering

Note that the comparables in the paper are 
(1) Sparse Subspace Clustering (SSC)  
(http://vision.jhu.edu/code/)
(2) robust subspace clustering via thresholding (TSC) 
(https://www.nari.ee.ethz.ch/commth/research/downloads/sc.html)
(3) Non-negative Contraint Lasso (NCL), which is implemented using Mosek solver in cvx
(http://cvxr.com/cvx/)

When use the code, please cite the following paper:

Unsupervised clustering under the Union of Polyhedral Cones (UOPC) model, Wenqi Wang, Vaneet Aggarwal, and Shuchin Aeron, Pattern Recognitino Letters, Vol 100, pp 104-109
Available: https://www.sciencedirect.com/science/article/pii/S0167865517303653




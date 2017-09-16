addpath MotionData
addpath SSC_ADMM_v1.1/
%%
load MotionData2.mat
Data = D; clear D;
Label = L; clear L;

disp('TSC algorithm 1');
TSC_Algo1.q = 1;
[TSC_Algo1.missrate, TSC_Algo1.grps,~,TSC_Algo1.CPUtime] = TSC_Update(Data, TSC_Algo1.q,Label);
    
disp('TSC algorithm 2');
TSC_Algo2.q = 2;
[TSC_Algo2.missrate, TSC_Algo2.grps,~,TSC_Algo2.CPUtime] = TSC_Update(Data, TSC_Algo2.q,Label);
 
disp('TSC algorithm 3');
TSC_Algo3.q = 3;
[TSC_Algo3.missrate, TSC_Algo3.grps,~,TSC_Algo3.CPUtime] = TSC_Update(Data, TSC_Algo3.q,Label);
 
disp('TSC algorithm 4');
TSC_Algo4.q = 4;
[TSC_Algo4.missrate, TSC_Algo4.grps,~,TSC_Algo4.CPUtime] = TSC_Update(Data, TSC_Algo4.q,Label);
 
disp('TSC algorithm 5');
TSC_Algo5.q = 5;
[TSC_Algo5.missrate, TSC_Algo5.grps,~,TSC_Algo5.CPUtime] = TSC_Update(Data, TSC_Algo5.q,Label);
 
disp('TSC algorithm 6');
TSC_Algo6.q = 6;
[TSC_Algo6.missrate, TSC_Algo6.grps,~,TSC_Algo6.CPUtime] = TSC_Update(Data, TSC_Algo6.q,Label);
 
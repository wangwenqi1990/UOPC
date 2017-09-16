addpath MotionData

%%
load MotionData1.mat
Data = D; clear D;
Label = L; clear L;
[SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
                    NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
                    KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
                    KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
                    TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20] = Cone_Algo_Compare_Motion(Data, Label);
save Res_Motion_Task2



%%
load MotionData2.mat
Data = D; clear D;
Label = L; clear L;
[SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
                    NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
                    KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
                    KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
                    TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20] = Cone_Algo_Compare_Motion(Data, Label);
save Res_Motion_Task4

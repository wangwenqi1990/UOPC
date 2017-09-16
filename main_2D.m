%trial_max   = 10;
%size_range  = 20 : 40: 400;

trial_max   = 1;
size_range  = [20, 30];
    
% Generate 4 cones in 2D data
theta_1s = -90/180 * pi;         theta_1e = 40 /180 * pi;    
theta_2s = 50/180 * pi;          theta_2e = 180/180 * pi;
    
% storage path
p = cd;
mkdir 2D_Result;
p = [p,'/2D_Result/'];

% each sample size run trial_max iteration via parallel computing
for N =  size_range
    parfor i=1:trial_max
        % generate 2D data and label
        theta1 = theta_1s + rand(N, 1) * (theta_1e - theta_1s);
        data1  = [cos(theta1)' ; sin(theta1)'];
        theta2 = theta_2s + rand(N, 1) * (theta_2e - theta_2s);
        data2  = [cos(theta2)' ; sin(theta2)'];        
        Data = [data1, data2];
        Label= [kron(ones(1,N), 1),kron(ones(1,N), 2)];
            
        % algorihtm
        [SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
            NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
            KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
            KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
            TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20] = Cone_Algo_Compare(Data, Label);
        
        % save file
        filename = [p,'2DSynthetic_Size', num2str(N), '_Trial', num2str(i),'.mat'];
        parsave(filename, SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
                NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
                KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
                KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
                TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20);
    end
end

%% plot figure
addpath('2D_Result');
%% 
% SSC
SSC_002     = nan(length(size_range), trial_max);
SSC_T002    = nan(length(size_range), trial_max);
SSC_02      = nan(length(size_range), trial_max);
SSC_T02     = nan(length(size_range), trial_max);
SSC_0       = nan(length(size_range), trial_max);
SSC_T0      = nan(length(size_range), trial_max);
SSC_2       = nan(length(size_range), trial_max);
SSC_T2      = nan(length(size_range), trial_max);
SSC_20      = nan(length(size_range), trial_max);
SSC_T20     = nan(length(size_range), trial_max);
SSC_200     = nan(length(size_range), trial_max);
SSC_T200    = nan(length(size_range), trial_max);

% TSC
TSC5    = nan(length(size_range), trial_max);
TSC_T5  = nan(length(size_range), trial_max);
TSC10    = nan(length(size_range), trial_max);
TSC_T10  = nan(length(size_range), trial_max);
TSC15    = nan(length(size_range), trial_max);
TSC_T15  = nan(length(size_range), trial_max);
TSC20    = nan(length(size_range), trial_max);
TSC_T20  = nan(length(size_range), trial_max);

% KNN-SC
KNN_SC2     = nan(length(size_range), trial_max);
KNN_SC_T2   = nan(length(size_range), trial_max);
KNN_SC4 = nan(length(size_range), trial_max);
KNN_SC_T4   = nan(length(size_range), trial_max);
KNN_SC6 = nan(length(size_range), trial_max);
KNN_SC_T6   = nan(length(size_range), trial_max);
KNN_SC8 = nan(length(size_range), trial_max);
KNN_SC_T8   = nan(length(size_range), trial_max);
KNN_SC10 = nan(length(size_range), trial_max);
KNN_SC_T10   = nan(length(size_range), trial_max);
KNN_SC12 = nan(length(size_range), trial_max);
KNN_SC_T12   = nan(length(size_range), trial_max);
KNN_SC14 = nan(length(size_range), trial_max);
KNN_SC_T14   = nan(length(size_range), trial_max);
KNN_SC16 = nan(length(size_range), trial_max);
KNN_SC_T16   = nan(length(size_range), trial_max);
% KNNM-SC
KNNM_SC2     = nan(length(size_range), trial_max);
KNNM_SC_T2   = nan(length(size_range), trial_max);
KNNM_SC4 = nan(length(size_range), trial_max);
KNNM_SC_T4   = nan(length(size_range), trial_max);
KNNM_SC6 = nan(length(size_range), trial_max);
KNNM_SC_T6   = nan(length(size_range), trial_max);
KNNM_SC8 = nan(length(size_range), trial_max);
KNNM_SC_T8   = nan(length(size_range), trial_max);
KNNM_SC10 = nan(length(size_range), trial_max);
KNNM_SC_T10   = nan(length(size_range), trial_max);
KNNM_SC12 = nan(length(size_range), trial_max);
KNNM_SC_T12   = nan(length(size_range), trial_max);
KNNM_SC14 = nan(length(size_range), trial_max);
KNNM_SC_T14   = nan(length(size_range), trial_max);
KNNM_SC16 = nan(length(size_range), trial_max);
KNNM_SC_T16   = nan(length(size_range), trial_max);
% NCL
LN002     = nan(length(size_range), trial_max);
LN_T002   = nan(length(size_range), trial_max);
LN02     = nan(length(size_range), trial_max);
LN_T02   = nan(length(size_range), trial_max);
LN0     = nan(length(size_range), trial_max);
LN_T0   = nan(length(size_range), trial_max);
LN2     = nan(length(size_range), trial_max);
LN_T2   = nan(length(size_range), trial_max);
LN20     = nan(length(size_range), trial_max);
LN_T20   = nan(length(size_range), trial_max);
LN200     = nan(length(size_range), trial_max);
LN_T200   = nan(length(size_range), trial_max);

%%
for s = 1: length(size_range)
    Size = size_range(s);
    for t = 1:trial_max
        disp(['Size: ' num2str(s), ' Trial: ' num2str(t)]);
        filename = ['2DSynthetic_Size' num2str(Size) '_Trial' num2str(t) '.mat'];
        load(filename);
        % SSC
        SSC_002(s, t)   = SSCO002.missrate;
        SSC_T002(s, t)  = SSCO002.time;
        SSC_02(s, t)   = SSCO02.missrate;
        SSC_T02(s, t)  = SSCO02.time;
        SSC_0(s, t)   = SSCO0.missrate;
        SSC_T0(s, t)  = SSCO0.time;
        SSC_2(s, t)   = SSCO2.missrate;
        SSC_T2(s, t)  = SSCO2.time;
        SSC_20(s, t)   = SSCO20.missrate;
        SSC_T20(s, t)  = SSCO20.time;
        SSC_200(s, t)   = SSCO200.missrate;
        SSC_T200(s, t)  = SSCO200.time;
        
        % TSC
        TSC5(s,t)      = TSC_Algo5.missrate;
        TSC_T5(s,t)    = TSC_Algo5.CPUtime;
        TSC10(s,t)      = TSC_Algo10.missrate;
        TSC_T10(s,t)    = TSC_Algo10.CPUtime;
        TSC15(s,t)      = TSC_Algo15.missrate;
        TSC_T15(s,t)    = TSC_Algo15.CPUtime;
        TSC20(s,t)      = TSC_Algo20.missrate;
        TSC_T20(s,t)    = TSC_Algo20.CPUtime;
        
        % NCL
        LN002(s, t)  = NCL002.missrate;
        LN_T002(s, t)  = NCL002.time;
        LN02(s, t)  = NCL02.missrate;
        LN_T02(s, t)  = NCL02.time;
        LN0(s, t)  = NCL0.missrate;
        LN_T0(s, t)  = NCL0.time;
        LN2(s, t)  = NCL2.missrate;
        LN_T2(s, t)  = NCL2.time;
        LN20(s, t)  = NCL20.missrate;
        LN_T20(s, t)  = NCL20.time;
        LN200(s, t)  = NCL200.missrate;
        LN_T200(s, t)  = NCL200.time;
        % KNN-SC
        KNN_SC2(s, t) = KNNG2.missrate;
        KNN_SC_T2(s, t)=KNNG2.time;
        KNN_SC4(s, t) = KNNG4.missrate;
        KNN_SC_T4(s, t)=KNNG4.time;
        KNN_SC6(s, t) = KNNG6.missrate;
        KNN_SC_T6(s, t)=KNNG6.time;
        KNN_SC8(s, t) = KNNG8.missrate;
        KNN_SC_T8(s, t)=KNNG8.time;
        KNN_SC10(s, t) = KNNG10.missrate;
        KNN_SC_T10(s, t)=KNNG10.time;
        KNN_SC12(s, t) = KNNG12.missrate;
        KNN_SC_T12(s, t)=KNNG12.time;
        KNN_SC14(s, t) = KNNG14.missrate;
        KNN_SC_T14(s, t)=KNNG14.time;
        KNN_SC16(s, t) = KNNG16.missrate;
        KNN_SC_T16(s, t)=KNNG16.time;
        
        % KNNM-SC
        KNNM_SC2(s, t) = KNN_M2.missrate;
        KNNM_SC_T2(s, t)=KNN_M2.time;
        KNNM_SC4(s, t) = KNN_M4.missrate;
        KNNM_SC_T4(s, t)=KNN_M4.time;
        KNNM_SC6(s, t) = KNN_M6.missrate;
        KNNM_SC_T6(s, t)=KNN_M6.time;
        KNNM_SC8(s, t) = KNN_M8.missrate;
        KNNM_SC_T8(s, t)=KNN_M8.time;
        KNNM_SC10(s, t) = KNN_M10.missrate;
        KNNM_SC_T10(s, t)=KNN_M10.time;
        KNNM_SC12(s, t) = KNN_M12.missrate;
        KNNM_SC_T12(s, t)=KNN_M12.time;
        KNNM_SC14(s, t) = KNN_M14.missrate;
        KNNM_SC_T14(s, t)=KNN_M14.time;
        KNNM_SC16(s, t) = KNN_M16.missrate;
        KNNM_SC_T16(s, t)=KNN_M16.time;
    end
end
clear 'SSCO0' 'SSCO002' 'SSCO02''SSCO2''SSCO20' 'SSCO200' 'NCL0' 'NCL02' 'NCL002' 'NCL2' 'NCL20'  'NCL200'      'KNNG2' 'KNNG4' 'KNNG6' 'KNNG8' 'KNNG10' 'KNNG12' 'KNNG14' 'KNNG16'        'KNN_M2' 'KNN_M4' 'KNN_M6' 'KNN_M8' 'KNN_M10' 'KNN_M12' 'KNN_M14' 'KNN_M16' 'TSC_Algo5' 'TSC_Algo10' 'TSC_Algo15' 'TSC_Algo20'

%% Plot each algorithm under different parameter
figure()
hold on
plot(size_range, mean(SSC_002, 2),'linewidth', 3);
plot(size_range, mean(SSC_02, 2),'linewidth', 3);
plot(size_range, mean(SSC_0, 2),'linewidth', 3);
plot(size_range, mean(SSC_2, 2),'linewidth', 3);
plot(size_range, mean(SSC_20, 2),'linewidth', 3);
plot(size_range, mean(SSC_200, 2),'linewidth', 3);
legend('SSC(002)','SSC(02)','SSC(0)','SSC(2)','SSC(20)','SSC(200)')
title('SSC Error')
fig=gcf;
saveas(gcf, 'SSC_Error.pdf');
hold off

figure()
hold on
plot(size_range, mean(SSC_T002, 2),'linewidth', 3);
plot(size_range, mean(SSC_T02, 2),'linewidth', 3);
plot(size_range, mean(SSC_T0, 2),'linewidth', 3);
plot(size_range, mean(SSC_T2, 2),'linewidth', 3);
plot(size_range, mean(SSC_T20, 2),'linewidth', 3);
plot(size_range, mean(SSC_T200, 2),'linewidth', 3);
legend('SSC(002)','SSC(02)','SSC(0)','SSC(2)','SSC(20)','SSC(200)')
title('SSC time')
fig=gcf;
saveas(gcf, 'SSC_Time.pdf');
hold off

% TSC Plot
figure()
hold on
plot(size_range, mean(TSC5, 2),'linewidth', 3);
plot(size_range, mean(TSC10, 2),'linewidth', 3);
plot(size_range, mean(TSC15, 2),'linewidth', 3);
plot(size_range, mean(TSC20, 2),'linewidth', 3);
legend('TSC5', 'TSC10', 'TSC15', 'TSC20');
title('TSC Error')
fig=gcf;
saveas(gcf, 'TSC_Error.pdf');
hold off

figure()
hold on
plot(size_range, mean(TSC_T5, 2),'linewidth', 3);
plot(size_range, mean(TSC_T10, 2),'linewidth', 3);
plot(size_range, mean(TSC_T15, 2),'linewidth', 3);
plot(size_range, mean(TSC_T20, 2),'linewidth', 3);
legend('TSC5', 'TSC10', 'TSC15', 'TSC20');
title('TSC time')
fig=gcf;
saveas(gcf, 'TSC_Time.pdf');
hold off

% LN
figure()
hold on
plot(size_range, mean(LN002, 2),'linewidth', 3);
plot(size_range, mean(LN02, 2),'linewidth', 3);
plot(size_range, mean(LN0, 2),'linewidth', 3);
plot(size_range, mean(LN2, 2),'linewidth', 3);
plot(size_range, mean(LN20, 2),'linewidth', 3);
plot(size_range, mean(LN200, 2),'linewidth', 3);
legend('NCL(002)','NCL(02)','NCL(0)','NCL(2)','NCL(20)','NCL(200)')
title('NCL Error')
fig=gcf;
saveas(gcf, 'NCL_Error.pdf');
hold off

figure()
hold on
plot(size_range, mean(LN_T002, 2),'linewidth', 3);
plot(size_range, mean(LN_T02, 2),'linewidth', 3);
plot(size_range, mean(LN_T0, 2),'linewidth', 3);
plot(size_range, mean(LN_T2, 2),'linewidth', 3);
plot(size_range, mean(LN_T20, 2),'linewidth', 3);
plot(size_range, mean(LN_T200, 2),'linewidth', 3);
legend('NCL(002)','NCL(02)','NCL(0)','NCL(2)','NCL(20)','NCL(200)')
title('NCL Time')
fig=gcf;
saveas(gcf, 'NCL_Time.pdf');
hold off

% KNN-SC
figure()
hold on
plot(size_range, mean(KNN_SC2, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC4, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC6, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC8, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC10, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC12, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC14, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC16, 2),'linewidth', 3);
legend('KNN-SC(2)','KNN-SC(4)','KNN-SC(6)','KNN-SC(8)','KNN-SC(10)','KNN-SC(12)','KNN-SC(14)','KNN-SC(16)');
title('KNN-SC Error')
fig=gcf;
saveas(gcf, 'KNNSC_Error.pdf');
hold off

figure()
hold on
plot(size_range, mean(KNN_SC_T2, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T4, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T6, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T8, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T10, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T12, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T14, 2),'linewidth', 3);
plot(size_range, mean(KNN_SC_T16, 2),'linewidth', 3);
legend('KNN-SC(2)','KNN-SC(4)','KNN-SC(6)','KNN-SC(8)','KNN-SC(10)','KNN-SC(12)','KNN-SC(14)','KNN-SC(16)');
title('KNN-SC Time')
fig=gcf;
saveas(gcf, 'KNNSC_Time.pdf');
hold off

% KNN-SC
figure()
hold on
plot(size_range, mean(KNNM_SC2, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC4, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC6, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC8, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC10, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC12, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC14, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC16, 2),'linewidth', 3);
legend('KNNM-SC(2)','KNNM-SC(4)','KNNM-SC(6)','KNNM-SC(8)','KNNM-SC(10)',...
    'KNNM-SC(12)','KNNM-SC(14)','KNNM-SC(16)');
title('KNNM-SC Error')
fig=gcf;
saveas(gcf, 'KNNMSC_Error.pdf');
hold off

figure()
hold on
plot(size_range, mean(KNNM_SC_T2, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T4, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T6, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T8, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T10, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T12, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T14, 2),'linewidth', 3);
plot(size_range, mean(KNNM_SC_T16, 2),'linewidth', 3);
legend('KNNM-SC(2)','KNNM-SC(4)','KNNM-SC(6)','KNNM-SC(8)','KNNM-SC(10)',...
    'KNNM-SC(12)','KNNM-SC(14)','KNNM-SC(16)');
title('KNNM-SC Time')
fig=gcf;
saveas(gcf, 'KNNMSC_Time.pdf');
hold off


%%  Compare different algorithm 
% Error Result
figure()
hold on
plot(size_range, log10(mean(KNN_SC16, 2)+10^-8), 'k-*', 'linewidth',3);
plot(size_range, log10(mean(KNNM_SC16, 2)+10^-8), 'm-+','linewidth',3);
plot(size_range, log10(mean(LN0, 2)), 'b--','linewidth',3);
plot(size_range, log10(mean(SSC_20, 2)), 'r--o','linewidth',3);
plot(size_range, log10(mean(TSC15, 2) +10^-8), 'g:+','linewidth',3);
fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',16)
set(findall(fig,'-property','FontName'),'FontName','Times New Roman')
legend('KNN-SC(K=16)', 'KNNM-SC(K=16)', 'NCL(\lambda=0)', 'SSC(\lambda=20)', 'TSC(K=15)');
xlabel('Sample Size');
ylabel('Clustering Error( log10 )');
saveas(gcf, '2DError.pdf');
hold off;
% Time Result
figure()
hold on
plot(size_range, mean(KNN_SC_T16, 2), 'k-*', 'linewidth',3);
plot(size_range, mean(KNNM_SC_T16, 2), 'm-+','linewidth',3);
plot(size_range, mean(LN_T0, 2), 'b--','linewidth',3);
plot(size_range, mean(SSC_T20, 2), 'r--o','linewidth',3);
plot(size_range, mean(TSC_T15, 2), 'g:+','linewidth',3);
legend('KNN-SC(K=16)', 'KNNM-SC(K=16)',  'SSC(\lambda=20)', 'TSC(K=15)');
%'NCL(\lambda=0)',
xlabel('Sample Size');
ylabel('CPU Time (s)');
fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',16)
set(findall(fig,'-property','FontName'),'FontName','Times New Roman')
saveas(gcf, '2DTime.pdf');
hold off;

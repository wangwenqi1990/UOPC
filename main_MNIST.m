size_range = 100 : 50: 400;
trial_max  = 6;

load MNIST;
L1 = find(labels ==1);
L3 = find(labels ==3);
L7 = find(labels ==7);

D1 = images(:, L1);
D3 = images(:, L3);
D7 = images(:, L7);
    
p = cd;
mkdir MNIST_Result;
p = [p,'/MNIST_Result/'];
    
for s = 1: length(Size_range)
    S_Size=Size_range(s);
    for trial = 1:max_trial
        disp(['========   Trial ', num2str(trial), '   =========']);
        Dt1 = D1(:, randsample(size(D1, 2), S_Size));
        Dt3 = D3(:, randsample(size(D3, 2), S_Size));
        Dt7 = D7(:, randsample(size(D7, 2), S_Size));
        
        Dt  = [Dt1, Dt3, Dt7];
        Lt  = [ones(1, S_Size), 2 * ones(1, S_Size), 3 * ones(1, S_Size)];
        [SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
            NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
            KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
            KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
            TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20] = Cone_Algo_Compare(Dt, Lt);
          
        filename = [p,'MNIST_Size', num2str(S_Size), '_Trial', num2str(trial),'.mat'];
        parsave(filename, SSCO0, SSCO002, SSCO02,SSCO2,SSCO20,SSCO200,...
            NCL0, NCL02, NCL002, NCL2, NCL20, NCL200, ...
            KNNG2, KNNG4, KNNG6, KNNG8, KNNG10, KNNG12, KNNG14, KNNG16,...
            KNN_M2, KNN_M4, KNN_M6, KNN_M8, KNN_M10, KNN_M12, KNN_M14, KNN_M16,...
            TSC_Algo5, TSC_Algo10, TSC_Algo15, TSC_Algo20);
    end
end

%% Data processing
addpath('MNIST_Result');
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


for s = 1: length(size_range)
    Size = size_range(s);
    for t = 1:trial_max
        disp(['Size: ' num2str(s), ' Trial: ' num2str(t)]);
        filename = ['MNIST_Size' num2str(Size) '_Trial' num2str(t) '.mat'];
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
        try
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
        catch
            disp('go');
        end
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

%% SSC Plot
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


%% Error Result
figure()
hold on
plot(size_range, log10(mean(KNN_SC16, 2)), 'k-*', 'linewidth',3);
plot(size_range, log10(mean(KNNM_SC16, 2)), 'm-+','linewidth',3);
plot(size_range, log10(mean(LN0, 2)), 'b--','linewidth',3);
plot(size_range, log10(mean(SSC_20, 2)), 'r--o','linewidth',3);
plot(size_range, log10(mean(TSC10, 2)), 'g:+','linewidth',3);
legend('KNN-SC(K=16)', 'KNNM-SC(K=16)', 'NCL(\lambda=0)', 'SSC(\lambda=20)', 'TSC(K=15)');
xlabel('Sample Size');
ylabel('Clustering Error( log10 )');
set(findall(fig,'-property','FontSize'),'FontSize',28)
set(findall(fig,'-property','FontName'),'FontName','Times New Roman')
fig=gcf;
saveas(gcf, 'MNIST_Error.pdf');
hold off;
% Time Result
figure()
hold on
plot(size_range, mean(KNN_SC_T16, 2), 'k-*', 'linewidth',3);
plot(size_range, mean(KNNM_SC_T16, 2), 'm-+','linewidth',3);
plot(size_range, mean(LN_T0, 2), 'b--','linewidth',3);
plot(size_range, mean(SSC_T20, 2), 'r--o','linewidth',3);
plot(size_range, mean(TSC_T20, 2), 'g:+','linewidth',3);
legend('KNN-SC(K=16)', 'KNNM-SC(K=16)', 'NCL(\lambda=0)', 'SSC(\lambda=20)', 'TSC(K=15)');
xlabel('Sample Size');
ylabel('CPU Time');
set(findall(fig,'-property','FontSize'),'FontSize',28)
set(findall(fig,'-property','FontName'),'FontName','Times New Roman')
fig=gcf;
saveas(gcf, '2DTime.pdf');
hold off;
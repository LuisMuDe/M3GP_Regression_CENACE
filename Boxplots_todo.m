% =========================
% DATOS
% =========================
TrainGPR = [37.00 39.14 37.04 36.48 35.83 37.45 36.06 38.94 37.20 38.10];
TrainM3GPR = [36.59 35.78 33.98 34.38 36.51 32.4 36 39.4 32.65 41.02];
TrainM3GP = [20.87 21.55 20.98 21.13 20.77 21.07 21.71 21.57 22.32 20.78];

TestGPR = [44.78 28.39 33.37 39.16 40.24 43.30 34.52 30.41 31.69 32.70];
TestM3GPR = [34.11 37 24.55 41.52 25.17 37.51 32.75 25.55 34.8 32.88];
TestM3GP = [41.26 37.43 38.86 36.17 39.34 41.01 37.64 61.87 36.88 50.91];

% =========================
% ORGANIZAR DATOS
% =========================
data = [TrainGPR(:); TrainM3GPR(:); TrainM3GP(:); ...
        TestGPR(:); TestM3GPR(:); TestM3GP(:)];

method = [repmat({'GPR'},10,1);
          repmat({'M3G-GPR'},10,1);
          repmat({'M3GP'},10,1);
          repmat({'GPR'},10,1);
          repmat({'M3GP-GPR'},10,1);
          repmat({'M3GP'},10,1)];

phase = [repmat({'Train'},30,1);
         repmat({'Test'},30,1)];

% =========================
% BOXPLOT AGRUPADO
% =========================
figure
boxplot(data, {method, phase}, 'FactorSeparator',1)

ylabel('Fitness')
title('Train vs Test Comparison by Method')
grid on
set(gca,'FontSize',12)

figure

subplot(1,2,1)
boxplot([TrainGPR(:), TrainM3GPR(:), TrainM3GP(:)], ...
        'Labels', {'GPR','M3GP-GPR','M3GP'})
title('Train')
ylabel('Fitness')
grid on

subplot(1,2,2)
boxplot([TestGPR(:), TestM3GPR(:), TestM3GP(:)], ...
        'Labels', {'GPR','M3GP-GPR','M3GP'})
title('Test')
grid on
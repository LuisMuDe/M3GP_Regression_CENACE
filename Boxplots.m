TrainGPR = [37.00 39.14 37.04 36.48 35.83 37.45 36.06 38.94 37.20 38.10];
TrainM3GPR = [36.59 35.78 33.98 34.38 36.51 32.4 36 39.4 32.65 41.02];
TrainM3GP = [20.87 21.55 20.98 21.13 20.77 21.07 21.71 21.57 22.32 20.78];

% Combinar datos en una sola matriz columna
data = [TrainGPR(:); TrainM3GPR(:); TrainM3GP(:)];

% Crear etiquetas de grupo
groups = [repmat({'GPR'},10,1);
          repmat({'M3GPR'},10,1);
          repmat({'M3GP'},10,1)];

% Boxplot
figure
boxplot(data, groups)
title('Comparison of Methods')
ylabel('Performance')
grid on
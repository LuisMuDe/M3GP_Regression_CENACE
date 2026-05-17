
%load('\M3GP_Regression_Consumo\Train_NewData\CENACE_M3GP_Train_NewData_1.mat')
%load('\M3GP_Regression_Consumo\Data\Train_CENACE.mat')

Y=TrainData(:,size(TrainData,2));
Z = [Z,Y];

%Y=TrainData(:,size(TestData,2));
%Z = [Z,Y];

 Pred = trainedModel.predictFcn(Z);


load('\M3GP_Regression_Consumo\Data\Test_CFE.mat')

X = TestData(:,1:(size(TestData,2)-1));

Pred = trainedModel.predictFcn(X);
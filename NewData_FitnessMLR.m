function ind = NewData_FitnessMLR(ind,params)

% directorio = pwd;% gets the current directory;
% na=strcat(directorio,'\train_');

load('Data/Test_CENACE.mat');
Dataall=TestData; %TrainData  TestData
             

% load('Data/Train_CENACE.mat');
% Dataall=TrainData; %TrainData  TestData


input_data=Dataall(:,1:(size(Dataall,2)-1));
output_data=Dataall(:,size(Dataall,2));

X=input_data;
Y=output_data;

%drawtree(ind.tree);

%load('test_terminals.mat'); 



globalDim = length(ind.tree.kids);
samples = length(Y);


for k=1:size(X,2)
  % declare terminals (X1,...,Xn)
  eval(strcat('X',num2str(k),'=X(:,k);'))
end
% clear unnecessary variables
clear X k


Z = zeros(samples,globalDim);

for t = 1:globalDim
		Trn = tree2str(ind.tree.kids{t});
    try
        Z(:,t)=eval(Trn);		
    catch 
            % because of the "nesting 32" error of matlab
 			Z(:,t)=str2num(evaluate_tree(ind.tree.kids{t},X));
            % error('LMD: something is wrong with the fitness function')
    end
    if length(Z(:,t))<samples
       Z(:,t)=Z(:,t)*ones(samples,1);
    end
end    




ZZZ= [ones(size(Z,1),1) Z];  

ProxY  = zeros(size(ZZZ,1),1);

for vars=1:size(ind.RegCoef,1)
    ProxY = ProxY + (ZZZ(:,vars)*ind.RegCoef(vars));
end

sumdif=sqrt(mean((ProxY - Y).^2));
ind.fitness=fixdec(sumdif,params.precision);   

ind.Z = Z;
ind.FE = ProxY;
ind.Test_Error = ProxY - Y;
% root square mean error
ind.Test_RSME= sqrt(mean((ProxY - Y).^2));
%mean square error 
ind.Test_MSE= mean((ProxY - Y).^2);
%mean absolute error 
ind.Test_MAE= mean(abs(ProxY - Y));


	
	
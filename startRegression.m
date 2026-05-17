warning ('off','all')

%% Experimental Parameters
directorio = pwd;% gets the current directory;
% Runs
 runs=10;
 gen=100;
 pop=500;

%Selection
selec='lexictour'; %tournament  SelectionNEAT lexictour
funcion='FitnessMLR'; %Fitness for regression
FunctionSet = 'VJ'; %ClassificationIM10

    load('Data/Train_CFE.mat');
    Dataall=TrainData; %TrainData  TestData
    nom='CFE_Consumo';               

    input_data=Dataall(:,1:(size(Dataall,2)-1));
    output_data=Dataall(:,size(Dataall,2));
                


        %% Runs
        for i=1:runs
            
            close all
       
            Ejecutar='RunM3GP';
            [train_x train_y test_x test_y] = subset(input_data, output_data, round(size(output_data, 1)*0.90));
            
            save train_x.txt 'train_x' -ascii;
            save train_y.txt 'train_y' -ascii;
			
            save test_x.txt 'test_x' -ascii;
            save test_y.txt 'test_y' -ascii;
            
              
            
            %% Saving terminals data for a faster load on fitness evaluation 
			na=strcat(directorio,'\train_');
            declareterminals(train_x,train_y,na);
          			
            na=strcat(directorio,'\test_');
            declareterminals(test_x,test_y,na);
                                
            
            %% GPLAB-all parameters
			%% Mod the last parameter is to select the function set for the experiment 
            [v,b]=eval([Ejecutar,'(gen,pop,i,nom,train_x,train_y,test_x,test_y,funcion,selec,directorio,FunctionSet,i)']);
            
        end % runs


fprintf('GP regression End...');

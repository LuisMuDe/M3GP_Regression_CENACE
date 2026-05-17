




A = []; 
for i=1:10

 direc=strcat('\M3GP_Regression_Consumo\Results\CFE_Consumo',int2str(i),'.mat');
 load(direc);
 
 Test_Ind(i) = NewData_FitnessMLR(b, v.params);


 % file_name=strcat('CFE_M3GP_Train_NewData_',int2str(i),'.mat');
 % Z = Test_Ind(i).Z;
 % save(file_name,'Z'); 

end

save("Runs_M3GP_10ind.mat", 'Test_Ind'); 


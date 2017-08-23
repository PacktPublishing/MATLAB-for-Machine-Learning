%Least-squares regression
VehicleData = readtable('VehiclesItaly.xlsx');
summary(VehicleData)
y=VehicleData.Registrations;
x=VehicleData.Population;
alpha=x\y
VehicleRegFit=alpha*x;
scatter(x,y)
hold on
plot(x,VehicleRegFit)
Residual=y-VehicleRegFit;
stem(Residual)
Rsq1 = 1 - sum((y - VehicleRegFit).^2)/sum((y - mean(y)).^2)
X = [ones(length(x),1) x];
alpha_beta = X\y
VehicleRegFit2 = X* alpha_beta;
scatter(x,y)
hold on
plot(x,VehicleRegFit)
plot(x,VehicleRegFit2,'--b')
Rsq2 = 1 - sum((y - VehicleRegFit2).^2)/sum((y - mean(y)).^2)

%Basic Fitting interface
VehicleData = readtable('VehiclesItaly.xlsx');
scatter(VehicleData.Population,VehicleData.Registrations)

%linear regression model
VehicleData = readtable('VehiclesItaly.xlsx');
VehicleData(1:10,:)
lrm = fitlm(VehicleData,'Registrations~Population')
plotResiduals(lrm) 
plotResiduals(lrm,'probability')
outliers = find(lrm.Residuals.Raw < -1.5*10^5)
lrm2 = fitlm(VehicleData,'Registrations~Population','Exclude',outliers)
plotResiduals(lrm2,'probability')
lrm1 = fitlm(VehicleData,'Registrations~Population')
lrm2 = fitlm(VehicleData,'Registrations~Population','RobustOpts','on')
subplot(1,2,1)
plotResiduals(lrm1,'probability')
subplot(1,2,2)
plotResiduals(lrm2,'probability')
outliers = find((lrm2.Residuals.Raw < -1.5*10^5) | (lrm2.Residuals.Raw > 1.5*10^5))
lrm3 = fitlm(VehicleData,'Registrations~Population','RobustOpts','on','Exclude',outliers)
subplot(1,2,1)
plotResiduals(lrm2,'probability')
subplot(1,2,2)
plotResiduals(lrm3,'probability')

%Multiple Linear Regression
load hald
whos
X = [ones(13,1), ingredients];
Y=(heat);
A=X\Y
lm=fitlm(ingredients,Y)
b=regress(Y,X)

%MLR with Categorical Predictor 
EmployeesSalary = readtable('employees.xlsx');
summary(EmployeesSalary)
EmployeesSalary.LevelOfEmployee=categorical(EmployeesSalary.LevelOfEmployee);
class(EmployeesSalary.LevelOfEmployee)
figure()
gscatter(EmployeesSalary.YearsExperience, EmployeesSalary. Salary, EmployeesSalary.LevelOfEmployee,'bgr','x.o')
title('Salary of  Employees versus Years of the Experience, Grouped by Level of Employee')
LMcat = fitlm(EmployeesSalary,'Salary~YearsExperience*LevelOfEmployee')
Xvalues = linspace(min(EmployeesSalary.YearsExperience),max(EmployeesSalary.YearsExperience));
figure()
gscatter(EmployeesSalary.YearsExperience, EmployeesSalary.Salary, EmployeesSalary.LevelOfEmployee,'bgr','x.o')
title('Salary of  Employees versus Years of the Experience, Grouped by Level of Employee')
line(Xvalues,feval(LMcat,Xvalues,'GeneralStaff'),'Color','b','LineWidth',2)
line(Xvalues,feval(LMcat,Xvalues,'TechnicalStaff'),'Color','r','LineWidth',2)
line(Xvalues,feval(LMcat,Xvalues,'Management'),'Color','g','LineWidth',2)

%Polynomial regression
Time = [6 8 11 14 16 18 19];
Temp = [4 7 10 12 11.5 9 7];
plot(Time,Temp,'o')
title('Plot of Temperature Versus Time')
coeff = polyfit(Time,Temp,2)
TimeNew = 6:0.1:19;
TempNew = polyval(coeff,TimeNew);
figure
plot(Time,Temp,'o', TimeNew, TempNew)
title('Plot of Data (Points) and Model (Line)')

%Regression Learner App
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/00291/airfoil_self_noise.dat';
websave('AirfoilSelfNoise.csv',url);
varnames = {' FreqH '; 'AngleD'; 'ChLenM'; 'FStVelMs'; ' SucSDTM ';' SPLdB'}; 
AirfoilSelfNoise = readtable('AirfoilSelfNoise.csv');
AirfoilSelfNoise.Properties.VariableNames = varnames;






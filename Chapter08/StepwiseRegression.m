url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/00243/yacht_hydrodynamics.data';
websave('yacht_hydrodynamics.csv',url);
varnames = {'LongPos'; 'PrismaticCoef'; 'LengDispRatio'; 'BeamDraughtRatio'; ' LengthBeamRatio ';'FroudeNumber';'ResResistance'}; 
YachtHydrodynamics = readtable('yacht_hydrodynamics.csv');
YachtHydrodynamics.Properties.VariableNames = varnames;
summary(YachtHydrodynamics)
YachtHydrodynamicsClean = rmmissing(YachtHydrodynamics);
size(YachtHydrodynamics)
size(YachtHydrodynamicsClean)
summary(YachtHydrodynamicsClean);
X =table2array(YachtHydrodynamicsClean(:,1:6));
Y =table2array(YachtHydrodynamicsClean(:,7));
subplot(2,3,1)
scatter(X(:,1),Y)
subplot(2,3,2)
scatter(X(:,2),Y)
subplot(2,3,3)
scatter(X(:,3),Y)
subplot(2,3,4)
scatter(X(:,4),Y)
subplot(2,3,5)
scatter(X(:,5),Y)
subplot(2,3,6)
scatter(X(:,6),Y)
Model1 = stepwiselm(X,Y,'constant','ResponseVar','ResResistance')
Model2 = stepwiselm(X,Y,'linear','ResponseVar','ResResistance')
Model3 = stepwiselm(X,Y,'interactions','ResponseVar','ResResistance')
Model4 = stepwiselm(X,Y,'quadratic','ResponseVar','ResResistance','Upper','quadratic')
RSquared = [Model1.Rsquared.Adjusted,Model2.Rsquared.Adjusted,Model3.Rsquared.Adjusted,Model4.Rsquared.Adjusted]
subplot(2,2,1)
plotResiduals(Model1,'fitted')
subplot(2,2,2)
plotResiduals(Model2,'fitted')
subplot(2,2,3)
plotResiduals(Model3,'fitted')
subplot(2,2,4)
plotResiduals(Model4,'fitted')
Rrange1 = [min(Model1.Residuals.Raw),max(Model1.Residuals.Raw)];
Rrange2 = [min(Model2.Residuals.Raw),max(Model2.Residuals.Raw)];
Rrange3 = [min(Model3.Residuals.Raw),max(Model3.Residuals.Raw)];
Rrange4 = [min(Model4.Residuals.Raw),max(Model4.Residuals.Raw)];
Rranges = [Rrange1;Rrange2;Rrange3;Rrange4]




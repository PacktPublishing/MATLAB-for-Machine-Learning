url = 'http://archive.ics.uci.edu/ml/machine-learning-databases/00236/seeds_dataset.txt';
websave('seeds_dataset.csv',url);
varnames = {'Area'; 'Perimeter'; 'Compactness'; 'LengthK'; 'WidthK';'AsymCoef';'LengthKG';'Seeds'}; 
Seeds_dataset = readtable('seeds_dataset.csv');
Seeds_dataset.Properties.VariableNames = varnames;
MissingValue = ismissing(Seeds_dataset);
RowsMissValue = find(any(MissValue==1,2));
Seeds_dataset =  rmmissing(Seeds_dataset);
VarMeas = table2array((Seeds_dataset(:,1:7)));
SeedClass = table2array((Seeds_dataset(:,8)));
plotmatrix(VarMeas)
r = corr(VarMeas)
[coeff,score,latent,tsquared,explained,mu] = pca(VarMeas);
coeff
size(VarMeas)
size(score)
gscatter(score(:,1),score(:,2),SeedClass,'brg','xo^')
latent
plot(latent)
xlabel('Principal Component')
ylabel('Variance Explained ')
biplot(coeff(:,1:2),'scores',score(:,1:2),'varlabels',varnames(1:7));





X=rand(100,2);
Y=(X(:,1)<0.3 | X(:,2)>0.6);
SimpleTree=fitctree(X,Y)
view(SimpleTree)
view(SimpleTree,'mode','graph')

%FisherIris dataset
load fisheriris
tabulate(species)
gplotmatrix(a,b,group)
gplotmatrix(meas, meas, species);
gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
xlabel('Petal length');
ylabel('Petal width');
ClassTree= fitctree(meas,species);
view(ClassTree)
view(ClassTree,'mode','graph')
MeasNew= [5.9 3.2 1.3 0.25];
predict(ClassTree,measNew)
resuberror = resubLoss(ClassTree)
cvrtree = crossval(ClassTree)
cvloss = kfoldLoss(cvrtree)














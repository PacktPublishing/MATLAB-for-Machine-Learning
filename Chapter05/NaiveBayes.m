load fisheriris
PetalLength = meas(:,3);
PetalWidth = meas(:,4);
PetalTable = table(PetalLength,PetalWidth);
NaiveModelPetal = fitcnb(PetalTable,species,'ClassNames',{'setosa','versicolor','virginica'})
NaiveModelPetal.DistributionParameters
NaiveModelPetal.DistributionParameters{2,1}
NaiveModelPetal.DistributionParameters{1,2}
NaiveModelPetalResubErr = resubLoss(NaiveModelPetal)
PredictedValue = predict(NaiveModelPetal,meas(:,3:4));
ConfMat = confusionmat(species,PredictedValue)
min(meas(:,3:4))
max(meas(:,3:4))
[x,y] = meshgrid(1:.1:6.9,0.1:.1:2.5);
PredictedGrid = predict(NaiveModelPetal, [x y]);
gscatter(x,y,PredictedGrid,'grb','sod')
xlabel('Petal Length')
ylabel('Petal Width')
title('{\bf Classification by Naïve Bayes Method}')








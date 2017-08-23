load fisheriris
KnnModel = fitcknn(meas,species,'NumNeighbors',3)
KnnModel.ClassNames
Knn3ResubErr = resubLoss(KnnModel)
PredictedValue = predict(KnnModel,meas);
ConfMat = confusionmat(species,PredictedValue)
CVModel = crossval(KnnModel)
KLossModel = kfoldLoss(CVModel)
KnnModel.NumNeighbors = 5
Knn5ResubErr = resubLoss(KnnModel)
CVModel = crossval(KnnModel);
K5LossModel = kfoldLoss(CVModel)
PredictedValue = predict(KnnModel,meas);
ConfMat = confusionmat(species,PredictedValue)
KnnModel2 = fitcknn(meas,species,'NSMethod','exhaustive','Distance','cosine','NumNeighbors',5);
Knn5ResubErr2 = resubLoss(KnnModel2)
PredictedValue = predict(KnnModel2,meas);
ConfMat = confusionmat(species,PredictedValue)









load thyroid_dataset;
InputData = thyroidInputs;
TargetData= thyroidTargets;
trainFcn = 'trainscg';
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize, trainFcn);
net.divideFcn = 'dividerand';  
net.divideMode = 'sample';  
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net.performFcn = 'crossentropy';
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', 'plotconfusion', 'plotroc'};
[net,tr] = train(net,InputData,TargetData);
OutputData = net(InputData);
e = gsubtract(TargetData, OutputData);
performance = perform(net, TargetData, OutputData);
TargetInd = vec2ind(TargetData);
OutputInd = vec2ind(OutputData);
percentErrors = sum(TargetInd ~= OutputInd)/numel(TargetInd);
trOut = OutputData(:,tr.trainInd);
vOut = OutputData (:,tr.valInd);
tsOut = OutputData (:,tr.testInd);
trTarg = TargetData(:,tr.trainInd);
vTarg = TargetData (:,tr.valInd);
tsTarg = TargetData (:,tr.testInd);
figure, plotconfusion(trTarg, trOut, 'Train', vTarg, vOut, 'Validation', tsTarg, tsOut, 'Testing', TargetData,OutputData,'All')
figure, plotroc(trTarg, trOut, 'Train', vTarg, vOut, 'Validation', tsTarg, tsOut, 'Testing', TargetData,OutputData,'All')


ConcreteData = readtable('Concrete_Data.xls');
summary(ConcreteData)
X = table2array(ConcreteData(:,1:8));
Y = table2array(ConcreteData(:,9));
plotmatrix(X,Y)
X = X';
Y = Y';
trainFcn = 'trainlm';
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);
view(net)
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};
net.divideFcn = 'dividerand';  
net.divideMode = 'sample';  
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net.performFcn = 'mse';
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', 'plotregression', 'plotfit'};
[net,tr] = train(net,X,Y);
figure, plotperform(tr)
figure, plottrainstate(tr)
Ytest = net(X);
e = gsubtract(Y,Ytest);
performance = perform(net, Y,Ytest);
figure, ploterrhist(e)
trOut = Ytest(tr.trainInd);
vOut = Ytest(tr.valInd);
tsOut = Ytest(tr.testInd);
trTarg = Y(tr.trainInd);
vTarg = Y(tr.valInd);
tsTarg = Y(tr.testInd);
plotregression(trTarg, trOut, 'Train', vTarg, vOut, 'Validation', tsTarg, tsOut, 'Testing',Y,Ytest,'All')


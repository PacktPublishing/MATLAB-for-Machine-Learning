EmergencyCalls = xlsread('EmergencyCalls.xlsx');
[rows,cols] = size(EmergencyCalls);
x = 1:rows;
plot(x,EmergencyCalls)
legend('Street 1','Street 2','Street 3','Street 4')
xlabel('Time')
ylabel('Emergency Calls')
ystats
PlotStat (x,EmergencyCallsNew)
histogram(x)
Vect1=[10,25,12,13,33,25,44,50,43,26,38,32,31,28,30];
histogram(Vect1)
Vect2=[10,25,12,13,33,25,44,50,43,26,38,32,31,28,30,15,16,22,35,18];
h = histogram(Vect2,12)
xlabel('Results')
ylabel('Frequency')
title('Customer Satisfaction Survey')
h.FaceColor = [0 0.5 0.5];
h = histogram(Vect2,12)
xlabel('Results')
ylabel('Frequency')
title('Customer Satisfaction Survey')
h.FaceColor = [0 0.5 0.5];
Vect3=[10,25,12,13,33,25,44,50,43,26,38,32,31,28,30,15,16,22,35,18];
nbin=10:10:50;
h = histogram(Vect3,nbin)
xlabel('Results')
ylabel('Frequency')
title('Customer Satisfaction Survey')
h.FaceColor = [0 0.5 0.5];
Vect4 = randn(1000,1);
h = histogram(Vect4,'Normalization','pdf') 
Vect5 = normrnd(50,3,1000,1);
Hist = histfit(Vect5)
normrnd(mu,sigma)
r=normrnd(3,1,100,1);
data1=normrnd(3,2,100,1);
data2=normrnd(2,1,100,1);
data3=normrnd(6,2,100,1);
data4=normrnd(8,0.5,100,1);
data5=normrnd(4,4,100,1);
data6=normrnd(5,1,100,1);
data=[data1 data2 data3 data4 data5 data6];
boxplot(data)
boxplot(data,'Labels',{'mu = 3','mu = 2','mu = 6','mu = 8','mu = 4','mu = 5'})
boxplot(dati,'Labels',{'mu = 3','mu = 2','mu = 6','mu = 8','mu = 4','mu = 5'}, 'LabelOrientation', 'inline')
vect1=normrnd(4,2,100,1);
vect2=normrnd(7,0.5,100,1);
figure
boxplot([vect1,vect2],'Notch','on','Labels',{'mu = 4','mu = 7'})
title('Comparison between two distributions')
Height = [168  168	168	173	163	174	174	174	175	175	176	165	180	180	182	182	183	186	191	191	192	165	167	174	176	167];
Weight = [65	 65	65	78	70	68	68	80	70	75	77	69	80	65	79	79	79	80	81	81	82	69	69	77	68	70];
scatter(Weight,Height)
IdealWeight=Height-100-[(Height-150)/4];
hold on
plot(IdealWeight,Height)
RandomMatrix = randn(100,4);
plotmatrix(RandomMatrix)



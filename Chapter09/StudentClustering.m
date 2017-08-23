load ClusterData.dat
scatter(ClusterData(:,1),ClusterData(:,2))
C = subclust(ClusterData,0.6);
size(C)
hold on 
plot(C(:,1),C(:,2),'x','LineWidth',4,'MarkerEdgeColor','k','MarkerSize',25)
[center,U,objFcn] = fcm(ClusterData,4);
figure
plot(objFcn)
title('Objective Function Values')
xlabel('Iteration Count')
ylabel('Objective Function Value')
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
figure
line(ClusterData(index1,1),ClusterData(index1,2),'linestyle','none','marker','o','color','g')
line(ClusterData(index2,1),ClusterData(index2,2),'linestyle','none','marker','x','color','b')
line(ClusterData(index3,1),ClusterData(index3,2),'linestyle','none','marker','^','color','m')
line(ClusterData(index4,1),ClusterData(index4,2),'linestyle','none','marker','*','color','r')
hold on
plot(center(1,1),center(1,2),'ko','markersize',15,'LineWidth',2)
plot(center(2,1),center(2,2),'kx','markersize',15,'LineWidth',2)
plot(center(3,1),center(3,2),'k^','markersize',15,'LineWidth',2)
plot(center(4,1),center(4,2),'k*','markersize',15,'LineWidth',2)
title('Student groupings')
xlabel('Motivational skils')
ylabel('Cognitive skills')


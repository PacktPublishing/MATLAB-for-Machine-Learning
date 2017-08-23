load matrix.txt
MatrixTxt=dlmread('matrix.txt',';')
MatrixTxt2=dlmread('matrix.txt',',','A1..B2')
MatrixCsv=csvread('matrix.csv')
MatrixCsv2=csvread('matrix.csv',0,0,[0,0,1,2])
values = xlsread('capri.xlsx','Temp')
[values,headertxt ]= xlsread('capri.xlsx','Temp')
row1_2 = xlsread('capri.xlsx','Temp',’A2:D3’)
column_C = xlsread('capri.xlsx','Temp',’A2:D3’)
TableMuseum = readtable('museum.xls')
TableMuseum2 = readtable('museum.xls','ReadVariableNames',false)
formatSpec = '%u%s%d%d';
fileID = fopen('Ferrari.txt');
Ferrari = textscan(fileID,formatSpec);
fclose(fileID)
whos Ferrari
Ferrari
celldisp(Ferrari)

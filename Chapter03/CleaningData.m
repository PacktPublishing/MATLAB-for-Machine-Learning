SampleData = readtable('CleaningData.xlsx');
summary(SampleData)
SampleData
%Find missing values
id = {'NA' '' '-19' -19 NaN '.'};
WrongPos = ismissing(SampleData,id);
SampleData(any(WrongPos,2),:)
%Change data type
SampleData.age = str2double(SampleData.age);
summary(SampleData(:,3))
SampleData.right = str2double(SampleData.right);
summary(SampleData(:,4))
%Replace missing value
SampleData = standardizeMissing(SampleData,-19);
summary(SampleData(:,3))
SampleDataNew = fillmissing(SampleData,'previous')
%Removing missing entries
SampleDataMinor = rmmissing(SampleData)
%Ordering the table
SampleDataOrdered = sortrows(SampleDataMinor,{'age'},{'descend'})
%Find outliers in data
SampleDataOutlier = isoutlier(SampleDataNew(2:end,3:5))
%Organizing 
SampleData1 = SampleDataNew(1:6,:)
SampleData2 = SampleDataNew(7:12,:)
SampleDataComplete = [SampleData1;SampleData2]
LifeExpectancy = readtable('LifeExpectancy.xlsx')
SampleDataLE = join(SampleDataComplete,LifeExpectancy,'Keys','gender')

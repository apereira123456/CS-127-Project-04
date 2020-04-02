%{
diabetes = load('diabetes.mat','d');
testData = [160,30];
threeNN(diabetes,testData)
%}

%{
iris = load('iris.mat','d');
testData = [5,3];
threeNN(iris,testData)
%}

%{
wheat = load('wheat.mat','d');
testData = [16.5,0.88];
threeNN(wheat,testData)
%}

%
q2 = load('Question2.mat','d');
testData = [-3,-3];
threeNN(q2,testData)
%}

%
q3 = load('Question3.mat','d');
testData = [0,5];
threeNN(q2,testData)
%}
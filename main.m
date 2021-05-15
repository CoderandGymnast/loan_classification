Preprocessing;

numNodes=[6 6 7];
m=size(train_data,1);
train_data=[ones(m,1) train_data];
learningRate=0.01;
regularizationRate=0.02;
w1=rand(6,7);
w2=rand(7,7);
numIters=100;

[weights1, weights2, histories] = gradientDescent(m, train_data, train_labels, w1, w2, learningRate, numIters, regularizationRate);


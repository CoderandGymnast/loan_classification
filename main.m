%DataFile = "CreditRating_Historical.dat";
%Preprocessing(DataFile);

pkg load io
trainData = load("trainData.dat");
trainLabels = load("trainLabels.dat");

numNodes = [7 7 7];
m = size(trainData, 1);
trainData = [ones(m, 1) trainData];
learningRate = 0.05;
regularizationRate = 0.02;
weights1 = rand(numNodes(2)-1, numNodes(1));
weights2 = rand(numNodes(3), numNodes(2));
numIters = 100;

[weights1, weights2, histories] = gradientDescent(m, trainData, trainLabels, weights1, weights2, learningRate, numIters, regularizationRate);

saveWeights(weights1, weights2, numNodes);


plot(histories);
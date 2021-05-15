Preprocessing;

numNodes = [7 7 7];
m = size(train_data, 1);
train_data = [ones(m, 1) train_data];
learningRate = 0.05;
regularizationRate = 0.02;
weights1 = rand(numNodes(2)-1, numNodes(1));
weights2 = rand(numNodes(3), numNodes(2));
numIters = 100;

[weights1, weights2, histories] = gradientDescent(m, train_data, train_labels, weights1, weights2, learningRate, numIters, regularizationRate);

saveWeights(weights1, weights2, numNodes);



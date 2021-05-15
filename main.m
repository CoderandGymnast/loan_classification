%DataFile = "CreditRating_Historical.dat";
%Preprocessing(DataFile);

pkg load io
trainData = load("trainData.dat");
trainLabels = load("trainLabels.dat");

numNodes = [7 7 7];
m = size(trainData, 1);
trainData = [ones(m, 1) trainData];
learningRate = 0.7;
regularizationRate = 0.001;
%weights1 = rand(numNodes(2)-1, numNodes(1));
%weights2 = rand(numNodes(3), numNodes(2));
pkg load io
weights1 = cell2mat(csv2cell("weights1.dat"));
weights2 = cell2mat(csv2cell("weights2.dat"));

numIters = [1000];

numBatch = 1;

for i = 1:numBatch

    tic
    [weights1, weights2, learningRate, histories] = gradientDescent(m, trainData, trainLabels, weights1, weights2, learningRate, numIters(i), regularizationRate);
    toc
    histories(numIters(i))

end

%saveWeights(weights1, weights2, numNodes);

plot(histories);

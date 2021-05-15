function [weights1, weights2, histories] = gradientDescent(m, X, Y, weights1, weights2, learningRate, numIters, regularizationRate)

    for i = 1:numIters

        % I. Gradient descent:
        [weights1Gradients, weights2Gradients] = backProgration(m, X, Y, weights1, weights2, regularizationRate);
        weights1 -= learningRate * weights1Gradients;
        weights2 -= learningRate * weights2Gradients;

        % II. Compute cost:
        J = crossEntropyLoss(m, H, Y, weights1, weights2);
        histories(i) = J;
    end

end

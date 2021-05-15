function [weights1, weights2, learningRate, histories] = gradientDescent(m, X, Y, weights1, weights2, learningRate, numIters, regularizationRate)

    histories = [];
    for i = 1:numIters

        % I. Gradient descent:
        [weights1Gradients, weights2Gradients, J] = backPropagation(m, X, Y, weights1, weights2, regularizationRate);
		if((i > 1)&& (histories(i-1) < J))
			learningRate/=2;
		end
        weights1 = weights1 - learningRate * weights1Gradients;
        weights2 = weights2 - learningRate * weights2Gradients;

        % II. Compute cost:
        histories(i) = J;
    end


end

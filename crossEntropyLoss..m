function [J] = crossEntropyLoss(m, H, Y, weights1, weights2)

    J = -(1 / m) * (Y(:)' * log(A)(:) + (1 - Y)(:)' * log(1 - A)(:));

    % Regularization:
    J += (lambda / (2 * m)) * (sum(weights1(:, 2:end)(:).^2) + sum(weights2(:, 2:end)(:).^2)); % NOTE: Ignore bias.
end

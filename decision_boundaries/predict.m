function [class] = predict(x)

    weights1File="weights1.dat";
    weights2File="weights2.dat";

    pkg load io
    weights1 = cell2mat(csv2cell(weights1File));
    weights2 = cell2mat(csv2cell(weights2File));

    z2 = x * weights1';
    a2 = [1 sigmoid(z2)];
    z3 = a2 * weights2';
    h = sigmoid(z3);

    res = -1;

    if h >= 0.5
        res = 1;
    else
        res = 0;
    end

	res
end
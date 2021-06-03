function [res] = predict(X)


	res = [];

    weights1File="weights1.dat";
    weights2File="weights2.dat";

    pkg load io
    weights1 = cell2mat(csv2cell(weights1File));
    weights2 = cell2mat(csv2cell(weights2File));

    m = size(X, 1);
	c = -1;
    for i = 1:m
        x = [1 X(i, :)];
        z2 = x * weights1';
        a2 = [1 sigmoid(z2)];
        z3 = a2 * weights2';
        h = sigmoid(z3);

        if h >= 0.5
            c = 1;
        else
            c = 0;
        end

		res = [res c];
    end

end

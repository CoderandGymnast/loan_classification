function [predictedClasses] = predictBatch(X)

    weights1File="weights1.dat";
    weights2File="weights2.dat";

    pkg load io
    weights1 = cell2mat(csv2cell(weights1File));
    weights2 = cell2mat(csv2cell(weights2File));

    m = size(X, 1);

    labels = {'A', 'B', 'C'};

	res = [];
    for i = 1:m
        x = [1 X(i, :)];
        z2 = x * weights1';
        a2 = [1 sigmoid(z2)];
        z3 = a2 * weights2';
        h = sigmoid(z3);

        [maxH, labelIndex] = max(h);

        if labelIndex == 1
            res = [res; "A"];
        elseif labelIndex == 2
            res = [res; "B"];
        else
            res = [res; "C"];
        end

    end
	predictedClasses = res;
end

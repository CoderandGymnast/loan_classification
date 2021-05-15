function [class] = predict(weights1File, weights2File, x)

    pkg load io
    weights1 = cell2mat(csv2cell(weights1File));
    weights2 = cell2mat(csv2cell(weights2File));

	z2=x*weights1';
	a2=[1 sigmoid(z2)];
	z3=a2*weights2';
	h=sigmoid(z3);

	res = ismember(h,max(h));

    labels = {'AAA', 'AA', 'A', 'BBB', 'BB', 'B', 'CCC'};
	for i=1:length(labels)
		if res(i)==1
			class=labels(i);
			return
		end
	end

end

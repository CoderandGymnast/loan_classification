weights1File="weights1.dat";
weights2File="weights2.dat";

pkg load io
weights1 = cell2mat(csv2cell(weights1File));
weights2 = cell2mat(csv2cell(weights2File));

m = size(X, 1);
A20 = []; % z2 <= 0.
A21 = []; % z2 > 0.

for i = 1:m
    x = [1 X(i, :)];
    z2 = x * weights1';
    a2 = sigmoid(z2);

    if z2 < 0
        A20 = [A20; a2];
    else
        A21 = [A21; a2];
    end

end

% C0=[];
% C1=[];

% for i=1:size(y,1)
% 	if y(i) == 0
% 		C0=[C0;A2(i)];
% 	else
% 		C1=[C1;A2(i)];
% 	end
% end

% plot(C0,zeros(length(C0),1),'.')
% hold on
% % plot(C1,zeros(length(C1),1),'x')

% plot(weights2(1)/-weights2(2), 0, "*")

% plot(A20, zeros(length(A20), 1), '.')
hold on
plot(A21, zeros(length(A21), 1), 'x')
hold on
plot(weights2(1)/-weights2(2), 0, "*")

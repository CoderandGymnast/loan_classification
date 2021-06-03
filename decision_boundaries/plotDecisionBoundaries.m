weights1File="weights1.dat";
weights2File="weights2.dat";

pkg load io
weights1 = cell2mat(csv2cell(weights1File));
weights2 = cell2mat(csv2cell(weights2File));

x1=-1:0.01:1;
for i=1:9
w=weights1(i,:);
y = @(x)(w(1) + w(2)*x)/-w(3); % NOTE: 0-based to 1-based.
x2=y(x1);
plot(x1,x2);
hold on;
end

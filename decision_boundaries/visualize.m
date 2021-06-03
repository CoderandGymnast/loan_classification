C0=[];
C1=[];

for i=1:size(y,1)
	if y(i) == 0
		C0=[C0;X(i,:)];
	else
		C1=[C1;X(i,:)];
	end
end

plot(C0(:,1),C0(:,2),'*')
hold on
plot(C1(:,1),C1(:,2),'*')

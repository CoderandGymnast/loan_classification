% x1 = [];
% x2 = [];
% y=[];
% a =-0.5:0.01:0.5;
% b = 0:0.01:0.25;

% for i = a

%     for j = b
%         x1 = [x1 i];
%         x2 = [x2 j];
%     end

% end

% for i=1:length(x1)
% 	if(x1(i)^2 < x2(i))
% 		y=[y 1];
% 	else
% 		y=[y 0];
% 	end
% end

% X = [x1' x2'];
% y = y';

X = [];
x1 = -1:0.01:1;
y = [];
for i = x1	
	X = [X ;[i (i^2 + 0.05)]];
	y = [y;1];
	X = [X ;[i (i^2 - 0.05)]];
	y = [y;0];
end



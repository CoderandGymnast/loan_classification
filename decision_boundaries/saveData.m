features = "";

for i = 1:size(X,1)
    line="";

    for j = 1:2
        line = strcat(line, ',', num2str(X(i,j)));
    end

    features = strcat(features, line(:, 2:end));
    features = strcat(features, "\n");
end

filename = "features.dat";
fid = fopen (filename, "w");
fputs (fid, features);
fclose (fid);

labels = "";

for i=1:length(y) 
    labels = strcat(labels, num2str(y(i)));
    labels = strcat(labels, "\n");
end

filename = "labels.dat";
fid = fopen (filename, "w");
fputs (fid, labels);
fclose (fid);

% NOTE: 
% 1. Must use "i=1:length(y)" to be able to save labels.

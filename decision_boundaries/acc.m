pkg load io

labelsFile = "labels.dat";
labels = cell2mat(csv2cell(labelsFile));
m = length(labels);

featuresFile = "features.dat";
features = [cell2mat(csv2cell(featuresFile))];

predictedClasses = predict(features);

trueCount = 0;

for i = 1:m
    % if labels(i) == predict(features(i, :)) % NOTE: load weights is time consuming.
    %     trueCount++;
    % end
    if predictedClasses(i) == labels(i)
        count++;
    end

end

accuracy = trueCount / m

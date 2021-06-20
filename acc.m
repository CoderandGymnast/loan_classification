pkg load io

labelsFile = "testing_labels.dat";
labels = csv2cell(labelsFile);
m = rows(labels);

highGrades = {'AAA', 'AA', 'A'};
mediumGrades = {'BBB', 'BB', 'B'};
lowGrades = {'CCC'};

testingLabels;

for i = 1:m

    if max(ismember(highGrades, labels(i, 1)))
        testingLabels = [testingLabels; "A"];
        continue;
    elseif max(ismember(mediumGrades, labels(i, 1)))
        testingLabels = [testingLabels; "B"];
        continue;
    else
        testingLabels = [testingLabels; "C"];
    end

end

featuresFile = "testing_features.dat";
features = [cell2mat(csv2cell(featuresFile))];

predictedClasses = predictBatch(features);

trueCount = 0;

for i = 1:m
    % if labels(i) == predict(features(i, :)) % NOTE: load weights is time consuming.
    %     trueCount++;
    % end
    if predictedClasses(i) == testingLabels(i)
        trueCount++;
    end

end

accuracy = trueCount / m

%main purpose: preprocessing dataset into train_data and train_labels
%-----------------------------------------------
% read the data file
function preprocessing(fileName)

    %Load .dat file
    pkg load io
    T = csv2cell(fileName);
    countColumns = columns(T);
    countRows = rows(T);

    % extract trainingFeatures
    trainingFeatures = cell2mat(T(:, 2:countColumns - 1));
    numLinearFeatures = size(trainingFeatures, 2);

    trainingFeatures(:, size(trainingFeatures, 2)) = trainingFeatures(:, size(trainingFeatures, 2)) / 12;

    % for i = 1:numLinearFeatures
    %     trainingFeatures = [trainingFeatures(:, i).^2 trainingFeatures];
    % end

    csvwrite("TrainingFeatures2.dat", trainingFeatures);

    %create trainLabels
    ratingLabels = T(:, countColumns);

    % create one-hot encoding labels
    trainLabels = zeros(countRows, 3);
    highGrades = {'AAA', 'AA', 'A'};
    mediumGrades = {'BBB', 'BB', 'B'};
    lowGrades = {'CCC'};

    for i = 1:countRows

        if max(ismember(highGrades, ratingLabels(i, 1)))
            trainLabels(i, 1) = 1;
			continue;
        elseif max(ismember(mediumGrades, ratingLabels(i, 1)))
            trainLabels(i, 2) = 1;
            continue;
        else
            trainLabels(i, 3) = 1;
        end

    end

    csvwrite("TrainingLabels2.dat", trainLabels);
end

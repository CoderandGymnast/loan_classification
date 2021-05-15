%main purpose: preprocessing dataset into train_data and train_labels
%-----------------------------------------------
% read the data file

pkg load io
T = csv2cell("CreditRating_Historical.dat");
count_columns = columns(T);
count_rows = rows(T);



% extract train_data 
train_data = cell2mat(T(: , 2:count_columns-1));
%train_data = table2array(train_data);
train_data(:,count_columns-1-1) = train_data(:,count_columns-1-1)/12;


%create train_labels
rating_labels = T(:,count_columns);
%rating_labels = table2array(rating_labels);


% create on-hot encoding labels
train_labels = zeros(count_rows,7);
labels = {'AAA','AA','A','BBB','BB','B','CCC'};

for i = 1:count_rows
    for j = 1:7
        exist = ismember(labels(j), rating_labels(i,1));
        if exist==1
            train_labels(i,j) = 1;
        break
        end
    end
end

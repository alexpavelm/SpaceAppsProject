function [model] = regressionModel(filename)
    data = csvread(filename);
    data = data';
    data = data(1:3, :);
    
    % scaling the data for a better approximation
    data(1, :) = data(1, :)./10;
    data(3, :) = data(3, :)./10;
    
    data_size = size(data);
    x_data = ones(data_size);
    x_data(2, :) = data(1, :);
    x_data(3, :) = data(2, :);
    
    y_data = data(3, :);
    y_data = y_data';
    
    model = regress(y_data, x_data);
    
   
    
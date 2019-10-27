function [AQI] = predictAQI(regressionModel, aod, co)
    % formula from "Converting AOD to PM2.5: A Statistical Approach",
    % NASA ARSET Workshop: NASA Earth Observations, Data and Tools for Air Quality Applications
    pm25 = aod*46.7+7.13;
    x = [1, pm25, co];
    AQI = x*regressionModel;
end


    
function[result] = AQI(a, b, c, d, e)
% 5 cities were used in order to calculate the 
% factors which influence the Air Quality Index: 
% Amsterdam, Shanghai, Moscow, Tokyo, Bucharest

% thus, we have previously calculated x, y, z, t, w through
% [A, B] = equationsToMatrix([eq1, eq2, eq3, eq4, eq5], [x, y, z, t, w])
% X = linsolve(A, B) 

x = 136.9790;
y = -238.5269;
z = 16.4115;
t = 333.0004;
w = -61.6090;

result = a*x + b*y + c*z + d*t + e*w;
result = abs(result);

end 
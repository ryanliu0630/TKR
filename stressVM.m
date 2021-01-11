function [VM] = stressVM(sigma)
%STRESSVM Summary of this function goes here
%   Calculates the Von Mises Stress given principal stress
x = sigma(1);
y = sigma(2);
z = sigma(3);
VM = (0.5 * ((x - y)^2 + (y - z)^2 + (z - x)^2))^0.5;
end


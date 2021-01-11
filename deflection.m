function [minDeflection,maxDeflection] = deflection(tp,p1,p2)
%DEFLECTIONEXTREME Summary of this function goes here
%   Detailed explanation goes here
t = 12; %total thickness
w = 40; %width
l = 80; %length
Gp = 1e3; %modulus of plastic
Gm = 210e3; %modulus of metal
Gb = 500; %modulus of tibial bone
h = 40; %effective height
x_P1 = 20;
x_P2 = l - 20;
x = 0:0.1:80;
x_20 = find(x == 20);
x_60 = find(x == 60);
tm = t - tp; 
yp = tm + 0.5 * tp;
ym = 0.5 * tm;
y_hat = (Gp * tp * w * yp + Gm * tm * w * ym)/(Gp * tp * w + Gm * tm * w);
I1 = (w * tp^3)/12;
I2 = (w * tm^3)/12;
I1_bar = I1 + (tp * w) * (y_hat - yp)^2;
I2_bar = I2 + (tm * w) * (y_hat - ym)^2;
k = (w * Gb)/h;
EI = Gp * I1_bar + Gm * I2_bar;
lambda = (k/(4 * EI))^(1/4);
V_left_1 = calcDeflection(x,x_P1,x_P2,l,p1,lambda,k);
V_right_1 = calcDeflection(x,x_P2,x_P1,l,p1,lambda,k);
V_P1 = [V_left_1(1:x_20) flip(V_right_1(1:x_60-1))];
V_left_2 = calcDeflection(x,x_P2,x_P1,l,p2,lambda,k);
V_right_2 = calcDeflection(x,x_P1,x_P2,l,p2,lambda,k);
V_P2 = [V_left_2(1:x_60) flip(V_right_2(1:x_20-1))];
V = V_P1 + V_P2;
minDeflection = min(V);
maxDeflection = max(V);
end


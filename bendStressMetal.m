function [Sigma] = bendStressMetal(tp,p1,p2,y)
%   calculates the bending stress of the polymer (x<a) 
%   tp = thickness of polymer
%   a = distance of load from the left
%   p = load
%   x,y = point where bending stress is calulated

t = 12; %total thickness
w = 40; %width
l = 80; %length
Ep = 1e3; %modulus of plastic
Em = 210e3; %modulus of metal
Eb = 500; %modulus of tibial bone
h = 40; %effective height
tm = t - tp; %thickness of metal
yp = 0.5 * tp; %centroid of polymer
ym = yp + 0.5 * tm; %centroid of metal
x_P1 = 20;
x_P2 = l - 20;
x = 0:0.1:80;
x_20 = find(x == 20);
x_60 = find(x == 60);
y_hat = ((Ep * w * tp * yp) + (Em * w * tm * yp)) / (Ep * w * tp + Em * w * tm);
I_1 = (w * tp^3)/12;
I_2 = (w * tm^3)/12;
I_1_bar = I_1 + (tp * w) * (y_hat - yp)^2;
I_2_bar = I_2 + (tm * w) * (y_hat - ym)^2;
k = (w * Eb)/h;
EI = Ep * I_1_bar + Em * I_2_bar;
lambda = (k/(4 * EI))^(1/4);
M_left_1 = calcMoment(x,x_P1,x_P2,l,p1,lambda);
M_right_1 = calcMoment(x,x_P2,x_P1,l,p1,lambda);
M_P1 = [M_left_1(1:x_20) flip(M_right_1(1:x_60-1))];
M_left_2 = calcMoment(x,x_P2,x_P1,l,p2,lambda);
M_right_2 = calcMoment(x,x_P1,x_P2,l,p2,lambda);
M_P2 = [M_left_2(1:x_60) flip(M_right_2(1:x_20-1))];
M = M_P1 + M_P2;
Sigma = Em * M * (y-ym)/EI;
end


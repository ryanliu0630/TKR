function [Sigma] = bendStressPolymer(tp,a,P,x,y)
%BENDSTRESSPOLYMER Summary of this function goes here
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
y_hat = ((Ep * w * tp * yp) + (Em * w * tm * yp)) / (Ep * w * tp + Em * w * tm);
I_1 = (w * tp^3)/12;
I_2 = (w * tm^3)/12;
I_1_bar = I_1 + (tp * w) * (y_hat - yp)^2;
I_2_bar = I_2 + (tm * w) * (y_hat - ym)^2;
k = (w * Eb)/h;
EI = Ep * I_1_bar + Em * I_2_bar;
lambda = (k/(4 * EI))^(1/4);
if x <= a
    M = calcMoment(x,a,l-a,l,P,lambda);
else
    M = calcMoment(x,a-l,a,l,P,lambda);
end
Sigma = Ep * M * (y-yp)/EI;
end


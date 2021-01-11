function [ps] = stressBExtreme(sigmaA,a,tp)
%STRESSBEXTREME Summary of this function goes here
%   Calculates the stress at point B in extreme case
p1 = 2500;
p2 = 500;
sz = sigmaA(3) * 0.8;
sy = sigmaA(1);
bs1 = bendStressPolymer(tp,20,p1,20,0.51*a);
bs2 = bendStressPolymer(tp,60,p2,20,0.51*a);
bs = bs1 + bs2;
sx = sigmaA(1) + bs;
ps = [sx,sy,sz];
end


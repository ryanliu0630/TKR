function [ps,a] = stressAHabitual(r1,r1p,r2,r2p,tp)
%STRESSAHABITUAL Summary of this function goes here
%   calculates principal stressses at point A habitual case
p1 = 1500;
p2 = 1500;
psi = 0;
Ep = 1e3; %modulus of plastic
Em = 210e3; %modulus of metal
v = 0.3;
[ps, a] = modHertz(p1,r1,r1p,r2,r2p,psi,tp,Ep,Em,v);
bs1 = bendStressPolymer(tp,20,p1,20,0);
bs2 = bendStressPolymer(tp,60,p2,20,0);
bs = bs1 + bs2;
ps(1) = bs + ps(1);


end


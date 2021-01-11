function [ps] = stressCHabitual(sigmaA,a,tp)
%STRESSCHABITUAL Summary of this function goes here
% Calculates the stress at point C habitual case
p1 = 1500;
p2 = 1500;
sz = sigmaA(3);
sy = 0.14 * sz;
sx = -0.14 * sz;
bs_p1_left = bendStressPolymer(tp,20,p1,20-a,0);
bs_p2_left = bendStressPolymer(tp,60,p2,20-a,0);
bs_p1_right = bendStressPolymer(tp,20,p1,20+a,0);
bs_p2_right = bendStressPolymer(tp,20,p1,20+a,0);
bs_left = bs_p1_left + bs_p2_left;
bs_right = bs_p1_right + bs_p2_right;
bs_max = max(bs_left,bs_right);
sx = sx + bs_max; 
ps = [sx,sy,sz];

end


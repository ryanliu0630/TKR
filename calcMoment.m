function[M]=calcMoment(x,a,b,l,P,lambda)

% equation for bending moment M(x) of a finite beam, from page 209

A=2.*sinh(lambda.*x).*sin(lambda.*x);
B=sinh(lambda.*l).*cos(lambda.*a).*cosh(lambda.*b)-sin(lambda.*l).*cosh(lambda.*a).*cos(lambda.*b);
C=cosh(lambda.*x).*sin(lambda.*x)-sinh(lambda.*x).*cos(lambda.*x);
E=sinh(lambda.*l).*(sin(lambda.*a).*cosh(lambda.*b)-cos(lambda.*a).*sinh(lambda.*b));
F=sin(lambda.*l).*(sinh(lambda.*a).*cos(lambda.*b)-cosh(lambda.*a).*sin(lambda.*b));
M=P/(2.*lambda).*1/((sinh(lambda.*l))^2-(sin(lambda.*l))^2).*(A.*B+C.*(E+F));

x0 = [14,28,15,40,11];  

%Optimization function
options = optimset('LargeScale', 'off');
[x, fval] = fmincon('objective',x0,[],[],[],[],[], [], 'constraints',options);
[cin,ceq] = constraints(x);

function [cin,ceq] = constraints(x)
%CONSTRAINTS Summary of this function goes here
%   Detailed explanation goes here
[v_tensile_E,v_compression_E] = deflection(x(5),2500,500);
[v_tensile_H,v_compression_H] = deflection(x(5),1500,1500);

t_f_diff_sagital = x(4) - x(2);
t_f_diff_frontal = x(3) - x(1);

rf_frontal = x(1);
rf_sagittal = x(2);
rt_frontal = x(3);
rt_sagittal = x(4);
tp = x(5);

cin = [t_f_diff_sagital - 2, t_f_diff_frontal - 2, 11 - rf_sagittal,...
    rf_sagittal - 30, 7 - rf_frontal, rf_frontal - 15, 43 - rt_sagittal,...
    rt_sagittal - 63, 14 - rt_frontal, rt_frontal - 21,...
    v_tensile_E - 0.78, v_compression_E - 0.84,...
    v_tensile_H - 0.8, v_compression_H - 2.1, tp - 12  ];
ceq = [];
end


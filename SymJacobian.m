clc; clear all; close all

syms q1 q2 q3 q4 q5 q6 q7
q = [q1,q2,q3,q4,q5,q6,q7];

[T_i,~,JPos] = forward(q);

j=jacobian(T_i,q);
AJacobian=matlabFunction(j,'File','AJacobian','Optimize',false,'Vars',{q});
clear all; close all; clc;

steps = 1500;

qO = [];
qO(:,1) = deg2rad([58.2686, 75.3224, 11.7968, 45.9029, -22.1081, -31.2831, -42.3712]');
  
gain = 1;
k = 1;

tic
for j = 1:3000
    q = zeros(7,steps);
    e = zeros(6,steps);
    q(:,1) = qO(:,j);
    for i = 1:steps-1
        [T_i,z] = forward(q(:,i)');
        e(:,i) = trajectory2(j)' - T_i;
        Err(:,k) = e(:,i);
        k = k + 1;
        J = AJacobian(q(:,i)');
        qdot = J'/(J*J')*e(:,i);
        q(:,i+1) = q(:,i) + gain.*qdot ;
        if (max(abs(e(:,i)))<0.001)
            break;
        end
    end
    clc
    j
    qO(:,j+1) = q(:,i+1);
end
toc

fprintf('\n')
disp('----------Resulting Transformation Matrix-----------')
disp(z)
disp('----------------------------------------------------')

Plot(qO,Err);
% print(qO');

% After running this main function, run vRepSimulation function separatly or call
% the function from with in this main script.
% vRepSimulation;
function vRepSimulation
% simRemoteApi.start(19999)
% Copy and paste this in the main stript in CoppeliaSim

q = importdata('Thanki_Dhruv.txt')';

sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    h=deg2rad([60.6814, 76.9216, 10.8163, 50.6658, -22.5383, -28.1644, -42.7095]');
    [r,h(1)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint1',sim.simx_opmode_blocking);
    [r,h(2)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint2',sim.simx_opmode_blocking);
    [r,h(3)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint3',sim.simx_opmode_blocking);
    [r,h(4)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint4',sim.simx_opmode_blocking);
    [r,h(5)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint5',sim.simx_opmode_blocking);
    [r,h(6)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint6',sim.simx_opmode_blocking);
    [r,h(7)]=sim.simxGetObjectHandle(clientID,'LBR_iiwa_7_R800_joint7',sim.simx_opmode_blocking);
    pause(1);
    for j=1:size(q,2)
    for i=1:7
        sim.simxSetJointTargetPosition(clientID,h(i),q(i,j),sim.simx_opmode_streaming);
    end
    pause(0.005);
    end
else
    disp('Failed connecting to remote API server');
end
sim.delete(); % call the destructor!
disp('Program ended');

end
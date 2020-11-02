function Plot(qO,Err)
qO = rad2deg(qO);

hold on
plot(Err(4,1:end))
plot(Err(5,1:end))
plot(Err(6,1:end))
legend('Phi','Theta','Psi')
title('Error in Orientation')
xlabel('Points along the Trajectory')
ylabel('Error Value')
% saveas('Error in Orientation.png')

figure
hold on
plot(qO(1,:))
plot(qO(2,:))
plot(qO(3,:))
plot(qO(4,:))
plot(qO(5,:))
plot(qO(6,:))
plot(qO(7,:))
legend('qO1','qO2','qO3','qO4','qO5','qO6','qO7')
title('Range of Motion of Every Joint')
xlabel('Points along the Trajectory')
ylabel('Degrees')
% saveas('Range of Motion of Every Joint.png')

figure
for i=1:size(qO,2)-1
    dq(:,i) = (qO(:,i+1)-qO(:,i))/0.005;
end
hold on
plot(dq(1,:))
plot(dq(2,:))
plot(dq(3,:))
plot(dq(4,:))
plot(dq(5,:))
plot(dq(6,:))
plot(dq(7,:))
legend('dq1','dq2','dq3','dq4','dq5','dq6','dq7')
title('Angular Velocity of Every Joint')
xlabel('Points along the Trajectory')
ylabel('Degrees per Second')
% saveas('Angular Velocity of Every Joint.png')

end
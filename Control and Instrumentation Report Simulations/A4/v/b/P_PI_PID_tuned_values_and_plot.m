function [] = P_PI_PID_tuned_values_and_plot()
Kp_p=4.863;
Kp_pi=4.5629;
Ki_pi=0.058266;
Kp_pid=41.3061;
Ki_pid=3.37;
Kd_pid=35.7642;
assignin('base', 'Kp_p', Kp_p);
assignin('base', 'Kp_pi', Kp_pi);
assignin('base', 'Ki_pi', Ki_pi);
assignin('base', 'Kp_pid', Kp_pid);
assignin('base', 'Ki_pid', Ki_pid);
assignin('base', 'Kd_pid', Kd_pid);
sim('P_PI_PID.slx'); % run the simulation of the untuned controllers with the above K parameters
plot(tout, P_out, 'r', tout, PI_out, 'g', tout, PID_out, 'b'); %plot the step responses for each of the controllers
legend('P', 'PI', 'PID');
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Tuned P, PI and PID controllers')
plant=tf(1,[1 6 5 0]);
P=feedback(pid(Kp_p)*plant,1,-1);
PI=feedback(pid(Kp_pi,Ki_pi)*plant,1,-1);
PID=feedback(pid(Kp_pid,Ki_pid,Kd_pid)*plant,1,-1);
%stepinfo() displays all info for a tf, requires Signal Processing Toolbox
P_info=stepinfo(P);
PI_info=stepinfo(PI);
PID_info=stepinfo(PID);
% Obtaining overshoots for each controlelr
P_Overshoot=P_info.Overshoot;
PI_Overshoot=PI_info.Overshoot;
PID_Overshoot=PID_info.Overshoot;
disp("----------Kp Ki and Kd (Tuned)-----------");
disp("P: Kp = " + Kp_p);
disp("PI: Kp = " + Kp_pi + ", Ki = " + Ki_pi);
disp("PID: Kp = " + Kp_pid + ", Ki = " + Ki_pid + ", Kd = " + Kd_pid);
disp('-----------Tuned Overshoots of closed loop transfer function with P, PI and PID-----------')
disp("P: " + P_Overshoot + "%");
disp("PI: " + PI_Overshoot + "%");
disp("PID: " + PID_Overshoot + "%");
end
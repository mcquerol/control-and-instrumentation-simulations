function [] = P_PI_PID_untuned_values_and_plot()
Kcr = 30; %critical gain obtained from routh array of G(s)
Pcr = 2.8099; %critical period, s
%the following three were obtained from Ziegler-Nichols method II table
%for P controller
kp_p = 0.5 * Kcr;
%for PI controller
kp_pi = 0.45 * Kcr;
Ti_pi = (1/1.2) * Pcr;
%for PID controller
kp_pid = 0.6 * Kcr;
Ti_pid = 0.5 * Pcr;
Td_pid = 0.125 * Pcr;
%These values below will be used for the op ampl implementations
%for P controller
Kp_p=kp_p;
%for PI controller
Kp_pi=kp_pi;
Ki_pi=kp_pi/Ti_pi;
%for PI controller
Kp_pid=kp_pid;
Ki_pid=kp_pid/Ti_pid;
Kd_pid=kp_pid*Td_pid;
% %output the values
% the assignin function saves the variables into the workspace 
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
title('Untuned P, PI and PID controllers');
plant=tf(1,[1 6 5 0]);
P=feedback(pid(Kp_p)*plant,1,-1);
PI=feedback(pid(Kp_pi,Ki_pi)*plant,1,-1);
PID=feedback(pid(Kp_pid,Ki_pid,Kd_pid)*plant,1,-1);
%display overshoots for each controller, requires Signal Processing Toolbox
P_info=stepinfo(P);
PI_info=stepinfo(PI);
PID_info=stepinfo(PID);
% Obtaining overshoots for each controlelr
P_Overshoot=P_info.Overshoot;
PI_Overshoot=PI_info.Overshoot;
PID_Overshoot=PID_info.Overshoot;
disp("----------Kp Ki and Kd (Untuned)-----------");
disp("P: Kp = " + Kp_p);
disp("PI: Kp = " + Kp_pi + ", Ki = " + Ki_pi);
disp("PID: Kp = " + Kp_pid + ", Ki = " + Ki_pid + ", Kd = " + Kd_pid);
disp('-----------Untuned Overshoots of closed loop transfer function with P, PI and PID-----------')
disp("P: " + P_Overshoot + "%");
disp("PI: " + PI_Overshoot + "%");
disp("PID: " + PID_Overshoot + "%");
end
function [] = P_PI_PID_2opamp_values()
R3=25e3; %assuming R3 for each controller is the same
R4=R3;
%-----------P controller --------------
Kp_p=4.863;
R1_p=10e3; %assuming value of R1 to be 10kohm +/- 0.5%
R2_p=Kp_p*R1_p;
%-----------PI controller --------------
Kp_pi=4.5629;
Ki_pi=0.058266;
C2_pi=47e-6; %assuming value of C1 to be 47uF
R1_pi=1/(Ki_pi*C2_pi);
R2_pi=Kp_pi*R1_pi;
%-----------PID controller --------------
Kp_pid=41.3061;
Ki_pid=3.37;
Kd_pid=35.7642;
C2_pid=33e-6; %assuming value of C2 to be 33uF
R1_pid=1/(Ki_pid*C2_pid);
C1_pid=47e-6; %assuming value of C1 to be 47uF
R2_pid=Kd_pid/C1_pid;
disp("----------P controller-----------");
disp("R1 = " + R1_p/1000 + " kohm");
disp("R2 = " + R2_p/1000 + " kohm");
disp("R3 = " + R3/1000 + " kohm");
disp("R4 = " + R4/1000 + " kohm");
disp("----------PI controller-----------");
disp("R1 = " + R1_pi/1000 + " kohm");
disp("R2 = " + R2_pi/1000000 + " Mohm");
disp("R3 = " + R3/1000 + " kohm");
disp("R4 = " + R4/1000 + " kohm");
disp("C2 = " + C2_pi*1000000 + " uF");
disp("----------PID controller-----------");
disp("R1 = " + R1_pid/1000 + " kohm");
disp("R2 = " + R2_pid/1000 + " kohm");
disp("R3 = " + R3/1000 + " kohm");
disp("R4 = " + R4/1000 + " kohm");
disp("C1 = " + C1_pid*1000000 + " uF");
disp("C2 = " + C2_pid*1000000 + " uF");
sim('P_PI_PID_2opamp_blocks.slx');
f1=figure('Name','Step response of 2OPA implementation(BLOCK): P and PI controllers','Numbertitle','off');
plot(tout, P_out, 'r', tout, PI_out, 'g'); %plot the step responses for each of the controllers
legend('P', 'PI');
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Step response of 2OPA implementation(BLOCK): P and PI controllers');
f2=figure('Name','Step response of 2OPA implementation(BLOCK): PID controller','Numbertitle','off');
plot(tout, PID_out); %plot the step responses for each of the controllers
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Step response of 2OPA implementation(BLOCK): PID controller');
sim('P_PI_PID_2opamp.slx');
f3=figure('Name','Step responses of 2OPA implementation: P and PI controllers','Numbertitle','off');
plot(tout, P_out, 'r', tout, PI_out, 'g'); %plot the step responses for each of the controllers
legend('P', 'PI');
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Step response of 2OPA implementation: P and PI controllers');
f4=figure('Name','Step responses of 2OPA implementation: PID controller','Numbertitle','off');
plot(tout, PID_out); %plot the step responses for each of the controllers
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Step response of 2OPA implementation: PID controller');
end
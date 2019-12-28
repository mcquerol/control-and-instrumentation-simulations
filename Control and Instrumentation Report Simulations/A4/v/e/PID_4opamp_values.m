function [] = PID_4opamp_values()
%-----------PID controller --------------
Kp=41.3061;
Ki=3.37;
Kd=35.7642;
R1=10e3; %assumiming value of R1 to be 10kohm +/- 0.5%
R2=Kp*R1;
Ci=47e-6; %assuming value of Ci to be 47uF +/- 0.5%
Ri=1/(Ki*Ci);
Cd=33e-6; %assuming value of Cd to be 33uF +/- 0.5%
Rd=Kd/Cd;
R = 18e3; %assuming value for summing amplifier resistor, will be the same for each controller
%output the values
disp("----------PID controller-----------");
disp("R = " + R/1000 + " kohm");
disp("R1 = " + R1/1000 + " kohm");
disp("R2 = " + R2/1000 + " kohm");
disp("Ri = " + Ri/1000 + " kohm");
disp("Ci = " + Ci*1000000 + " uF");
disp("Rd = " + Rd/1000000 + " Mohm");
disp("Cd = " + Cd*1000000 + " uF");
sim('PID_4opamp_blocks.slx');
f1 = figure('Name', 'Step responses of 4 OPA implementation (BLOCK) of PID controller', 'NumberTitle' , 'off');
plot(tout, PID_out, 'r'); %plot the step responses for each of the controllers
grid;
title('Step responses of 4 OPA implementation (BLOCK) of PID controller');
xlabel('time (s)');
ylabel('Magnitude');
sim('PID_4opamp.slx');
f2 = figure('Name', 'Step responses of 4 OPA implementation of PID controller', 'NumberTitle' , 'off');
plot(tout, PID_out, 'r'); %plot the step responses for each of the controllers
grid;
title('Step responses of 4 OPA implementation of PID controller');
xlabel('time (s)');
ylabel('Magnitude');
end
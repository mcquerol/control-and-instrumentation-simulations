function [] = P_PI_4opamp_values()
R=18e3; %value of R (summing amplifier resistor) will be the same for P and PI
%-----------P controller --------------
Kp_p=4.863;
R1_p=10e3; %assuming value of R1 to be 10kohm +/- 0.5%
R2_p=Kp_p*R1_p;
%-----------PI controller --------------
Kp_pi=4.5629;
Ki_pi=0.058266;
R1_pi=10e3; %assuming value of R1 to be 10kohm +/- 0.5%
R2_pi=Kp_pi*R1_pi;
Ci_pi=47e-6; %assuming value of Ci to be 47uF +/- 0.5%
Ri_pi=1/(Ki_pi*Ci_pi);
%----------------------------------------
disp("----------P controller-----------");
disp("R1 = " + R1_p/1000 + " kohm");
disp("R2 = " + R2_p/1000 + " kohm");
disp("R = " + R/1000 + " kohm");
disp("----------PI controller-----------");
disp("R1 = " + R1_pi/1000 + " kohm");
disp("R2 = " + R2_pi/1000 + " kohm");
disp("Ri = " + Ri_pi/1000 + " kohm");
disp("Ci = " + Ci_pi*1000000 + " uF");
disp("R = " + R/1000 + " kohm");
sim('P_PI_4opamp_blocks.slx');
f1=figure('Name','Step responses of 4 OPA implementation(BLOCK): P and PI controllers','Numbertitle','off');
plot(tout, P_out, 'r', tout, PI_out, 'g'); %plot the step responses for each of the controllers
legend('P', 'PI');
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Step responses of 4 OPA implementation(BLOCK): P and PI controllers')
sim('P_PI_4opamp.slx');
f2=figure('Name','Step responses of 4 OPA implementation(Block) : P and PI controllers','Numbertitle','off');
plot(tout, P_out, 'r', tout, PI_out, 'g'); %plot the step responses for each of the controllers
legend('P', 'PI');
grid;
xlabel('time (s)');
ylabel('Magnitude');
title('Step responses of 4 OPA implementation: P and PI controllers')
end
function [] = system_plot(time,ref,out,pid)
%Run pid.slx to get data to workspace%
tiledlayout(2,1);
nexttile
plot(time,ref,'b',time,out,'r');
legend('reference','plant output');
xlabel('time (s)');
ylabel('Magnitude');
title('Reference and plant output');
grid;
nexttile
plot(time,pid,'b');
xlabel('time (s)');
ylabel('Magnitude');
title('Pid output');
grid;
end
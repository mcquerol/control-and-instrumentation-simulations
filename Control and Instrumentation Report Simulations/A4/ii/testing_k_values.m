function [] = testing_k_values
g=tf(1,[1 18 77 0]); %plant of the system
%these are the different values of kp that will be tested
Kp1=1;
Kp2=1385;
Kp3=918;
Kp4=500;
Kp5=5000;
%the following lines are the different closed loop transfer functions, one
%for each value of kp [this is a unity feedback system]
c1=feedback(Kp1*g,1,-1);
c2=feedback(Kp2*g,1,-1);
c3=feedback(Kp3*g,1,-1);
c4=feedback(Kp4*g,1,-1);
c5=feedback(Kp5*g,1,-1);
%the lines below display the 5 different figures, each labeled respectively
figure('Name','Testing for Kp of 1','NumberTitle','off');
step(c1);
figure('Name','Testing for Kp of 1385','NumberTitle','off');
step(c2);
figure('Name','Testing for Kp of 918','NumberTitle','off');
step(c3);
figure('Name','Testing for Kp of 500','NumberTitle','off');
step(c4);
figure('Name','Testing for Kp of 5000','NumberTitle','off');
step(c5);
end
function [] = DC_motor_drive_system_unity_feedback_root_locus()
%defining the blocks
G1=tf(1, [0.01 1]);
G2=tf([0.17 1], [0.085 0]);
G3=G1;
G4=tf([0.15 1], [0.051 0]);
G5=tf(70, [0.0067 1]);
G6=tf(0.21, [0.15 1]);
G7=tf(130, [1 0]);
G8=tf(0.212);
G9=tf(0.1, [0.01 1]);
G10=tf(0.0044, [0.01 1]);
SIGN=-1; %all feedbacks are negative
G9with7=G9/G7;% moving the measuring point to be able to solve
%solving each section algebraically 
A=feedback(G6*G7,G8,SIGN);
B=G4*G5*A;
C=feedback(B,G9with7,SIGN);
D=G2*G3;
E=D*C;
F=feedback(E,G10,SIGN);
G=G1*F;
%outputting zpk and step reponse
zpk(G)
step(G)
rlocus(G)
Kp=1;% defining the proportioal gain
C=pid(Kp); %defines a p controller, it's assumed that it's a pid controller where ti and td = 0
T=feedback(C*G,1,-1);
rlocus(T)
end
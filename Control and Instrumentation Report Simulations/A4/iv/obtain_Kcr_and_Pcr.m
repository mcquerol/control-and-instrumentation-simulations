function [] = obtain_Kcr_and_Pcr()
    for K = 1:50
        Gc=pid(K);
        plant=zpk(tf(1, [1 6 5 0])); 
        Cs_Rs=zpk(feedback(Gc*plant,1,-1));
        P=pole(Cs_Rs);
        [Wn]=damp(Cs_Rs);
        if (real(P(1))==0 || real(P(2))==0 || real(P(3))==0) %check if the real part of the poles are = 0
            Wn=Wn(1);
            Kcr=K;
            Pcr=(2*pi)/Wn;
            disp("Natural frequency of system is " + Wn + " rad/s");
            disp("Critical gain Kcr = " + Kcr);
            disp("Critical Period Pcr = " + Pcr + " s");
            disp("Poles of the system at a Kcr of " + Kcr + ": ");
            disp("-----------------------");
            disp(P)
            figure();
            step(Cs_Rs);
        end
    end
    %the following three were obtained from Ziegler-Nichols II table
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
    figure();
    step(P,'r',PI,'g',PID,'b',10);
    legend('P','PI','PID');
    title('Untuned step responses of P PI and PID');
    disp("----------Kp Ki and Kd (Untuned)-----------");
    disp("P: Kp = " + Kp_p);
    disp("PI: Kp = " + Kp_pi + ", Ki = " + Ki_pi);
    disp("PID: Kp = " + Kp_pid + ", Ki = " + Ki_pid + ", Kd = " + Kd_pid);
    disp("-----------Untuned Controller equations----------");
    disp("P: " + Kp_p);
    disp("PI: " + Kp_pi + " + " + Ki_pi + "/s ");
    disp("PID: " + Kp_pid + " + " + Ki_pid + "/s " + "+ " + Kd_pid + "s");
    disp('-----------Untuned Overshoots of closed loop transfer function with P, PI and PID-----------')
    disp("P: " + P_Overshoot + "%");
    disp("PI: " + PI_Overshoot + "%");
    disp("PID: " + PID_Overshoot + "%");
    
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
    sim('P_PI_PID_check.slx'); % run the simulation of the untuned controllers with the above K parameters
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
    disp("-----------Tuned Controller equations----------");
    disp("P: " + Kp_p);
    disp("PI: " + Kp_pi + " + " + Ki_pi + "/s ");
    disp("PID: " + Kp_pid + " + " + Ki_pid + "/s " + "+ " + Kd_pid + "s");
    disp('-----------Tuned Overshoots of closed loop transfer function with P, PI and PID-----------')
    disp("P: " + P_Overshoot + "%");
    disp("PI: " + PI_Overshoot + "%");
    disp("PID: " + PID_Overshoot + "%");
    figure();
    step(P,'r',PI,'g',PID,'b',10);
    legend('P','PI','PID');
    title('Tuned step responses of P PI and PID');
end
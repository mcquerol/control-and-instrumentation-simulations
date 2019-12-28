function[] = sserror_check()
syms K s
Kp=subs((K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5),s,0);
simplified_error=simplify(Kp);
disp(simplified_error);
K=65;
s=0;
Kp=(K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5);
ssr_step=1/(1-(0.235*K));
%unit ramp-----------------------------
Kv=s*(K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5);
ssr_ramp=1/Kv;
%unit parabola-----------------------------
Ka=s^2*(K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5);
ssr_parab=1/Ka;
%output sserrors---------------------------
disp("A gain, K, of " + K + " gives:");
disp("min unit step error = " + ssr_step);
disp("min unit ramp error = " + abs(ssr_ramp));
disp("min unit parabola error = " + abs(ssr_parab));
%---------------------------------------------------
K=4.25;
%unit step------------------------------------------
Kp=(K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5);
ssr_step=1/(1-(0.235*K));
%unit ramp-----------------------------
Kv=s*(K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5);
ssr_ramp=1/Kv;
%unit parabola-----------------------------
Ka=s^2*(K*(s+2))/(s^3+(1.5*s^2)+(16*s)-8.5);
ssr_parab=1/Ka;
%output sserrors---------------------------
disp("A gain, K, of " + K + " gives:");
disp("max unit step error = " + ssr_step);
disp("max unit ramp error = " + abs(ssr_ramp));
disp("max unit parabola error = " + abs(ssr_parab));
end
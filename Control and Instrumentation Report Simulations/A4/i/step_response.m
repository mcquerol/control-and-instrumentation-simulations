function [] = step_response()
Gs=tf(31.0974492, [1 4.50258465 31.0974492]); %calculated second order transfer function
step(Gs); %creates a step response plot of the transfer function G(s)
end

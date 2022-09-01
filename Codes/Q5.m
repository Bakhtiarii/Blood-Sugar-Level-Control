H = tf(-4.875e-6,[1 0.1173 0.002308 0]);
Hz = c2d(H,5,'zoh');
pidTuner(Hz)
%find k = -3.9502
%%
k = -3.9502;
step(feedback(Hz*k,1))
stepinfo(feedback(Hz*k,1))
[y,t] = step(feedback(H*k,1));
ess = abs(1-y(end));
disp(['steady state error = ' , num2str(ess)]);
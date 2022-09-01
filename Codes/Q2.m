H = tf(-4.875e-6,[1 0.1173 0.002308 0]);
%pidTuner
%pidTuner is Kp = -8.03, Ki = -0.00204
C = tf([-8.03 -0.00204],[1 0]);
display(C);
step(feedback(H*C,1))
stepinfo(feedback(H*C,1))
[y,t] = step(feedback(H*C,1));
ess = abs(1-y(end));
disp(['steady state error = ' , num2str(ess)]);
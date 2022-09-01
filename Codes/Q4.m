H = tf(-4.875e-6,[1 0.1173 0.002308 0]);
disp('Discrete-time transfer function with Sample time 5 seconds : ')
Hz = c2d(H,5,'zoh')
%%
figure(1)
rlocus(Hz)
figure(2)
margin(Hz)
disp(['Bandwidth is : ' num2str(bandwidth(Hz))]) 
H = tf(-4.875e-6,[1 0.1173 0.002308 0]);
Hz = c2d(H,5,'zoh');
k = -3.9502;
figure(1)
rlocus(Hz*k)
figure(2)
margin(Hz*k)
disp(['Bandwidth is : ' num2str(bandwidth(Hz*k))]) 
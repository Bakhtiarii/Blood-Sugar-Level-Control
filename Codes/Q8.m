% deadbeat
Hs = tf(-4.875e-6,[1 0.1173 0.002308 0]);
Hz = c2d(Hs,5,'zoh');
zeros = zero(Hz);
f1 = -1/(zeros(1)-1);
f2 = -f1 * zeros(1);
F = tf([f1 f2],[1 0 0],5);
Cz = F/((1-F)*Hz);
Cz = minreal(Cz);
%analog
syms s z T
Cs = (-8.03*s -0.00204)/s;
% we set T 1, 5, 10
Ts = 5;
%bilinear transformation 
Cz1_temp = subs(Cs,s,(2/T)*((z-1)/(z+1)));
Cz1_temp = subs(Cz1_temp,T,Ts);
Cz1_temp = simplifyFraction(Cz1_temp);
Cz1 = tf([-80351 80249],[10000 -10000],5);
% zero-pole mapping
Cz2_temp = (z-exp(-(0.00204/8.03)*T))/(z-1);
k = -8.03 /subs(subs(Cz2_temp,T,Ts),z,-1);
Cz2 = double(k)*tf([1 -exp(-(0.00204/8.03)*Ts)],[1 -1],5);

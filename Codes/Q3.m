syms s z T
Cs = (-8.03*s -0.00204)/s;
% we set T 1, 5, 10
Ts = 10;
%bilinear transformation 
Cz1 = subs(Cs,s,(2/T)*((z-1)/(z+1)));
Cz1 = subs(Cz1,T,Ts);
Cz1 = simplifyFraction(Cz1);
% zero-pole mapping
Cz2_temp = (z-exp(-(0.00204/8.03)*T))/(z-1);
k = -8.03 /subs(subs(Cz2_temp,T,Ts),z,-1);
Cz2 = Cz2_temp*k;
Cz2 = vpa(subs(Cz2,T,Ts));





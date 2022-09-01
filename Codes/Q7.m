H = tf(-4.875e-6,[1 0.1173 0.002308 0]);
Hz = c2d(H,5,'zoh');
zeros = zero(Hz);
%% find deadbeat controller
f1 = -1/(zeros(1)-1);
f2 = -f1 * zeros(1);
F = tf([f1 f2],[1 0 0],5);
Cz = F/((1-F)*Hz);
Cz = minreal(Cz);
step(feedback(Hz*Cz,1))

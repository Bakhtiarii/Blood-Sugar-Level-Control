A = [0 -4.5 0 ; 0 -0.025 0.000013 ; 0 0 -5.54/60];
B = [0 ; 0 ; 1/12];
C = [1 0 0]; 
T = 5;
G = expm(A*T);
func = @(x) expm(A*x)*B;
H = integral(func,0,T,'ArrayValued',1);
D = 0;
s = ss(G,H,C,D,5);
Gz = tf(s);
[num,den,ts] = tfdata(Gz);
an = cell2mat(den);
format long
disp('Now we show a1 a2 a3')
celldisp(den)
M = [H  G*H G^2*H];
%%
W = [an(3) an(2) 1 ; an(2) 1 0; 1 0 0];
T = M*W;
%inv(T)*G*T
k_hat = [-an(4) -an(3) -an(2)];
u = k_hat*inv(T);
disp('U is')
disp(u)

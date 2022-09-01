A = [0 -4.5 0 ; 0 -0.025 0.000013 ; 0 0 -5.4/60];
B = [0 ; 0 ; 1/12];
C = [1 0 0]; 
T = 5;
G = expm(A*T);
func = @(x) expm(x*A)*B;
H = integral(func,0,T,'ArrayValued',1);
controllability  = [H  G*H G^2*H];
observability  = [C ; C*G ; C*G^2];
disp(['Rank of controllability matrix is ' num2str(rank(controllability)) ])
disp(['Rank of observability matrix is ' num2str(rank(observability)) ])
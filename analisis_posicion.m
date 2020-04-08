%Taller - Análisis de posición
%Yithzak Alarcón - T00045029
O2A = 79;
AB = 171;
BC = 112;
CD = 150;
O6D = 146;
O26 = 380;
theta_O2 = 45;
%Definición del ángulo AB
theta_ab = acosd((O2A*cosd(theta_O2 + 90))/(AB))-90;
%Definición de la longitud de O2 a B
O2B = O2A*cosd(theta_O2)+AB*cosd(theta_ab);
%Definición del ángulo de BA
theta_ba = -theta_ab + 180;
%Definición del ángulo de BC
theta_bc = theta_ba-34;
%Definición de distancias entre origenes
O6B = O26 - O2B;
%Definición de ecuaciones no-lineales
syms x y
%sol = solve(-O6B + BC*exp(1i*theta_bc) + CD*exp(1i*x) == O6D*exp(1i*y),[x,y]);
sol = solve([-O6B + BC*cosd(theta_bc) + CD*cosd(x) == O6D*cosd(y),BC*sind(theta_bc) + CD*sind(x) == O6D*sind(y)],[x,y]);
theta_1 = sol.x;
theta_2 = sol.y;
theta_cd = theta_1(1);
theta_O6D = theta_2(1);
fprintf('Theta_cd: %.3f\n',theta_cd);
fprintf('Theta_O6D: %.3f\n',theta_O6D);
Ax = [0 O2A*cosd(theta_O2)];
Ay = [0 O2A*sind(theta_O2)];
Bx = [O2B O2A*cosd(theta_O2)];
By = [0 O2A*sind(theta_O2)];
Cx = [O2B O2B+BC*cosd(theta_bc)];
Cy = [0 BC*sind(theta_bc)];
Dx = [O2B+BC*cosd(theta_bc) O2B+BC*cosd(theta_bc)+CD*cosd(theta_cd)];
Dy = [BC*sind(theta_bc) BC*sind(theta_bc)+CD*sind(theta_cd)];
O6x = [O2B+BC*cosd(theta_bc)+CD*cosd(theta_cd) O26];
O6y = [BC*sind(theta_bc)+CD*sind(theta_cd) 0];
figure;
plot(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy,O6x,O6y);

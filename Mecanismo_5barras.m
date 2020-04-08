%Mecanismo de 5 barras
%Yithzak Alarcon - T00045029
%Constantes
L2 = 17; L4 = 17; L3 = 10; L5 = 10;
O24 = 13;
r = 5;
%Variantes
theta = 0:30:360;
phi = 0;
gamma = 0:360;
Cx = 6 + r*cosd(gamma);
Cy = 20 + r*sind(gamma);
axis equal;
for i = 1:size(theta,2)
    plot(Cx,Cy,'r');
    hold on;
    axis([-10 20 -5 30]);
    phi = theta(i);
    angles = fsolve(@(x) myfun(x,r,phi,L2,L4,L3,L5,O24),[30,30,30,30]);
    disp(angles);
    P2x = [0 L2*cosd(angles(1))];
    P2y = [0 L2*sind(angles(1))];
    P3x = [L2*cosd(angles(1)) L2*cosd(angles(1))+L3*cosd(angles(2))];
    P3y = [L2*sind(angles(1)) L2*sind(angles(1))+L3*sind(angles(2))];
    O4x = [0 O24];
    O4y = [0 0];
    P4x = [O24 O24+L4*cosd(angles(3))];
    P4y = [0 L4*sind(angles(3))];
    P5x = [O24+L4*cosd(angles(3)) O24+L4*cosd(angles(3))+L5*cosd(angles(4))];
    P5y = [L4*sind(angles(3)) L4*sind(angles(3))+L5*sind(angles(4))];
    plot(P2x,P2y,'k',P3x,P3y,'b',O4x,O4y,'g',P4x,P4y,'k',P5x,P5y,'b');
    axis([-10 20 -5 30]);
    hold off;
    drawnow
end

function F = myfun(x,r,phi,L2,L4,L3,L5,O24)
Bx = 6 + r*cosd(phi);
By = 20 + r*sind(phi);
Q2 = x(1); Q3 = x(2); Q4 = x(3); Q5 = x(4);
F(1) = L2*cosd(Q2)+L3*cosd(Q3)-O24-L4*cosd(Q4)-L5*cosd(Q5);
F(2) = L2*sind(Q2)+L3*sind(Q3)-L4*sind(Q4)-L5*sind(Q5);
F(3) = L2*cosd(Q2)+L3*cosd(Q3)-Bx;
F(4) = L2*sind(Q2)+L3*sind(Q3)-By;
end



    
%Mecanismo6elementos
%Yithzak Alarcón - T00045029
AB = 40; BC = 20; EC = 45; ED = 35; AE = 40; EF = 40;
ang = fsolve(@(x) myfun(x,AB,BC,EC,ED,AE,EF),[25 10 45 100]);
disp(ang);
function F = myfun(x,AB,BC,EC,ED,AE,EF)
    Q2 = x(1);
    Q3 = x(2);
    QED = x(3);
    Q5 = x(4);
    F(1) = AB*cosd(Q2) + BC*cosd(Q3) - EC*cosd(QED+30) - AE;
    F(2) = AB*sind(Q2) + BC*sind(Q3) - EC*sind(QED+30);
    F(3) = ED*cosd(QED) - (sqrt(EF^2+ED^2-2*EF*ED*cosd(QED)))*cosd(Q5)-EF;
    F(4) = ED*sind(QED) - (sqrt(EF^2+ED^2-2*EF*ED*cosd(QED)))*sind(Q5);
end


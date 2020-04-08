%Diseño de levas
%Yithzak Alarcon - T00045029
%Constantes
L3 = 2; L6 = 2; L5 = 2; L1 = 0.811; L2 = 1.189;
b1 = 38.2; b2 = 35.6; b3 = 120; b4 = 29.86; b5 = 76.34; b6 = 60;
m2 = 0.0334; R = 3.5;
phi = 0:1:360;
%Funciones
%H_1
S1 = L1*(1-cos((pi*phi)/(2*b1)))+R;
%Lineal
S2 = m2*(phi-b1)+L1+R;
%C_2
S3 = (L3*(((phi-(b1+b2))/b3)+(1/pi)*sin((pi*(phi-(b1+b2)))/b3)))+(L1+L2)+R;
%Cte
S4 = L6 + L3 + phi*0 + R;
%C_3
S5 = (L5*(1-((phi-(b1+b2+b3+b4))/b5)+(1/pi)*sin((pi*(phi-(b1+b2+b3+b4)))/b5)))+L6+R;
%H_4
S6 = L6*(1-sin(((pi*(phi-(b1+b2+b3+b4+b5)))/(2*b6))))+R;
%Concatenación y límites
S1 = S1(phi<=b1);
S2 = S2(phi>b1 & phi<=(b1+b2));
S3 = S3(phi>(b1+b2) & phi<=(b1+b2+b3));
S4 = S4(phi>(b1+b2+b3) & phi<=(b1+b2+b3+b4));
S5 = S5(phi>(b1+b2+b3+b4) & phi<=(b1+b2+b3+b4+b5));
S6 = S6(phi>(b1+b2+b3+b4+b5) & phi<=(b1+b2+b3+b4+b5+b6));
S = [S1 S2 S3 S4 S5 S6];
%Plotting
phi2 = phi*(pi/180);
polarplot(phi2,S);
title('Diseño de leva');
    
    
    
    
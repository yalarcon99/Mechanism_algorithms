%Diseño de leva
% Yithzak Alarcon - Sara L. Contreras

%Constantes
B6 = 60;
B3 = 120;
L3 = 2;
L5 = 2;
L6 = 2;
%Incognitas
B1 = 38.2;
L1 = (B1^2*L6)/(B6^2);
L2 = 2-L1 ;
B2 = 35.6;
B5 = 76.34;
B4 = 360 - B1 - B2- B3 -B5 - B6;


phi1 = 0:B1;
phi2 = 0:B2;
phi3 = 0:B3;
phi4 = 0:B4;
phi5 = 0:B5;
phi6 = 0:B6;

%Perfil H-1
for i=1:length(phi1)
    S1(i) = L1*(1-cos((pi/2)*(phi1(i)/B1)));
    V1(i) = ((pi/2)*(L1/B1))*(sin((pi/2)*(phi1(i)/B1)));
    A1(i) = ((pi^2/4)*(L1/B1^2))*(cos((pi/2)*(phi1(i)/B1)));
end 
%Perfil Lineal
for i=1:length(phi2)
    S2(i) = (L2/B2)*phi2(i);
    V2(i) = V1(length(V1));
    A2(i) = 0;
end 
%Perfil C-2
for i=1:length(phi3)
    S3(i) = L3*((phi3(i)/B3)+(1/pi)*sin(pi*(phi3(i)/B3)));
    V3(i) = (L3/B3)*(1 + cos(pi*(phi3(i)/B3)));
    A3(i) = -((pi*L3)/B3^2)*(sin(pi*(phi3(i)/B3)));
end 
%Detencion
for i=1:length(phi4)
    S4(i) = S3(length(S3));
    V4(i) = 0;
    A4(i) = 0;
end 
%Perfil C-3
for i=1:length(phi5)
    S5(i) = L5*(1-(phi5(i)/B5)+(1/pi)*sin(pi*(phi5(i)/B5)));
    V5(i) = -(L5/B5)*(1-cos(pi*(phi5(i)/B5)));
    A5(i) = -((pi*L5)/B5^2)*(sin(pi*(phi5(i)/B5)));
end 
%Perfil H-4
for i=1:length(phi6)
    S6(i) = L6*(1-sin((pi/2)*(phi6(i)/B6)));
    V6(i) = -((pi/2)*(L6/B6))*(cos((pi/2)*(phi6(i)/B6)));
    A6(i) = ((pi^2*L6)/(4*B6^2))*(sin((pi/2)*(phi6(i)/B6)));
end 

%Grafica posicion
figure, stem(phi1,S1)
hold on
stem(phi2+B1,S2+L1)
hold on
stem(phi3+B2+B1,S3+L2+L1)
hold on
stem(phi4+B3+B2+B1,S4+L2+L1)
hold on
stem(phi5+B4+B3+B2+B1,S5+L2+L1)
hold on
stem(phi6+B5+B4+B3+B2+B1,S6), title('Función de desplazamiento')

%Grafica de velocidad
figure, stem(phi1,V1)
hold on
stem(phi2+B1,V2)
hold on
stem(phi3+B2+B1,V3)
hold on
stem(phi4+B3+B2+B1,V4)
hold on
stem(phi5+B4+B3+B2+B1,V5)
hold on
stem(phi6+B5+B4+B3+B2+B1,V6), title('Función de velocidad')

%Grafica de aceleracion
figure, stem(phi1,A1)
hold on
stem(phi2+B1,A2)
hold on
stem(phi3+B2+B1,A3)
hold on
stem(phi4+B3+B2+B1,A4)
hold on
stem(phi5+B4+B3+B2+B1,A5)
hold on
stem(phi6+B5+B4+B3+B2+B1,A6), title('Función de aceleración')
%% Perfil de la leva
B6 = 60; B3 = 120; L3 = 2; L5 = 2; L6 = 2;
B1 = 38.2; L1 = (B1^2*L6)/(B6^2); L2 = 2-L1; B2 = 35.6; B5 = 76.34; B4 = 360 - B1 - B2- B3 -B5 - B6;

phi = 0:5:360;
phi1 = phi;
phi2 = phi-B1;
phi3 = phi-B1-B2;
phi4 = phi-B1-B2-B3;
phi5 = phi-B1-B2-B3-B4;
phi6 = phi-B1-B2-B3-B4-B5;

S1 = L1*(1-cos((pi/2)*(phi1/B1)));
S2 = L1+(phi2*(1/30));
S3 = L1+L2+(L3*((phi3/B3)+(1/pi)*sin(pi*(phi3/B3))));
S4 =((L1+L2+L3)+phi*0);
S5 = L1+L2+(L5*(1-(phi5/B5)+(1/pi)*sin(pi*(phi5/B5))));
S6 = L6*(1-sin((pi/2)*(phi6/B6)));

S1 = S1(phi<=B1);
S2 = S2(phi>B1 & phi<=B1+B2);
S3 = S3(phi>B1+B2 & phi<=B1+B2+B3);
S4 = S4(phi>B1+B2+B3 & phi<=B1+B2+B3+B4);
S5 = S5(phi>B1+B2+B3+B4 & phi<=B1+B2+B3+B4+B5);
S6 = S6(phi>B1+B2+B3+B4+B5 & phi<=B1+B2+B3+B4+B5+B6);
S = [S1 S2 S3 S4 S5 S6];

figure, plot(phi,S)
R = 3.5 + S;
figure, polarplot(pi*phi/180,R)

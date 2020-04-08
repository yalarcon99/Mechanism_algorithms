%Instantaneous speed centers
%Yithzak Alarcon - T00045029
%Constants
AB = 40; BC = 20; EC = 45; ED = 35; AE = 40; EF = 40; theta_ED = 30;
%Input range
inp = 57:1:80;
for j = 1:size(inp,2)
    %Input
    Q2 = inp(j);
    %Q2 = 60;
    %Solution
    angles = fsolve(@(x) pos(x,Q2,AB,BC,EC,theta_ED,AE,EF,ED),[30,45,90,40]);
    disp(angles);
    Q3 = angles(1); Q4 = angles(2); Q6 = angles(3); DF = angles(4);
    %Defining points
    O2 = [0,0];
    B = O2 + AB*[cosd(Q2), sind(Q2)];
    C = B + BC*[cosd(Q3), sind(Q3)];
    E = O2 + [AE, 0];
    D = E + ED*[cosd(Q4) sind(Q4)];
    F = O2 + [AE+EF,0];
    %Defining vector points
    points = [B;O2;C;E;D;F];
    %Input text location
    points_input = [-25,-10];
    %Points labels
    txt = ['B(2,3)   '; 'A(1,2)   '; '   C(3,4)'; '   E(1,4)'; '   D(4,5)'; '   F(1,6)'];
    %Defining geometry loop to fill the area
    h = [C(1) E(1) D(1) C(1)];
    m = [C(2) E(2) D(2) C(2)];
    %Filling the area
    fill(h,m,'y'); %axis off;
    %Graphics specifications
    axis equal; hold on; axis([-220 120 -75 120]);
    %Plotting
    plot([O2(1) B(1)],[O2(2) B(2)],[B(1) C(1)],[B(2) C(2)],'b-','LineWidth',2);
    plot([C(1) E(1)],[C(2) E(2)],'b-',[E(1) D(1)],[E(2) D(2)],'b-','LineWidth',2);
    plot([C(1) D(1)],[C(2) D(2)],'b-',[D(1) F(1)],[D(2) F(2)],'b-','LineWidth',2);
    plot(points(:,1),points(:,2),'r.','MarkerSize',17);
    %Plotting points labels
    for i = 3:size(points,1)
        text(points(i,1),points(i,2),txt(i,:),'FontWeight','bold');
    end
    text(points(2,1),points(2,2),txt(2,:),'FontWeight','bold','HorizontalAlignment','right');
    text(points(1,1),points(1,2),txt(1,:),'FontWeight','bold','HorizontalAlignment','right');
    %Input label description
    t = ['\theta_{2} = ' num2str(Q2) '°'];
    text(points_input(1),points_input(2),t,'FontWeight','bold');
    %Intersecting lines and points of intersection
    x = -500:0.1:500; 
    %Point (2,4)
    [y24a,y24b,p24x,p24y] = drawL(x,C,B,E,O2);
    %Point (1,3)
    [y13a,y13b,p13x,p13y] = drawL(x,C,E,B,O2);
    %Point (1,5)
    [y15a,y15b,p15x,p15y] = drawLInf(x,D,E,D,F);
    %Point (3,5)
    P13 = [p13x,p13y];P15 = [p15x,p15y];
    [y35a,y35b,p35x,p35y] = drawL(x,C,D,P13,P15);
    %Point (2,5)
    P35 = [p35x,p35y];
    [y25a,y25b,p25x,p25y] = drawL(x,O2,P15,B,P35);
    %Point (3,6)
    [y36a,y36b,p36x,p36y] = drawLEq(x,P13,F,D,F,P35);
    %Point (2,6)
    P36 = [p36x,p36y];
    [y26a,y26b,p26x,p26y] = drawL(x,B,P36,O2,F);
    %Point (4,6)
    [y46a,y46b,p46x,p46y] = drawL(x,C,P36,E,F);
    %Plotting Intersection Points and lines
    plot(x,y24a,'m-.',x,y24b,'m-.',x,y13a,'m-.',x,y13b,'m-.');
    plot(x,y15a,'m-.',x,y15b,'m-.',x,y35a,'m-.',x,y35b,'m-.');
    plot(x,y25a,'m-.',x,y25b,'m-.');plot(x,y36a,'m-.',x,y36b,'m-.');
    plot(x,y26a,'m-.',x,y26b,'m-.');plot(x,y46a,'m-.',x,y46b,'m-.');
    plot(p24x,p24y,'c.','MarkerSize',17);plot(p13x,p13y,'c.','MarkerSize',17);
    plot(p15x,p15y,'c.','MarkerSize',17);plot(p35x,p35y,'c.','MarkerSize',17);
    plot(p25x,p25y,'c.','MarkerSize',17);plot(p36x,p36y,'c.','MarkerSize',17);
    plot(p26x,p26y,'c.','MarkerSize',17);plot(p46x,p46y,'c.','MarkerSize',17);
    text(p24x,p24y,'  P(2,4)','FontWeight','bold');
    text(p13x,p13y,'  P(1,3)','FontWeight','bold');
    text(p15x,p15y,'  P(1,5)','FontWeight','bold');
    text(p35x,p35y,'P(3,5)  ','FontWeight','bold','HorizontalAlignment','right');
    text(p25x,p25y,'P(2,5)  ','FontWeight','bold','HorizontalAlignment','right');
    text(p36x,p36y,'P(3,6)  ','FontWeight','bold','HorizontalAlignment','right');
    text(p26x,p26y,'P(2,6)  ','FontWeight','bold','HorizontalAlignment','right');
    text(p46x,p46y,'  P(4,6)','FontWeight','bold');
    hold off;
    drawnow;
end

function F = pos(x,Q2,AB,BC,EC,tED,AE,EF,ED)
    Q3 = x(1); Q4 = x(2); Q6 = x(3); DF = x(4);
    F(1) = AB*cosd(Q2)+BC*cosd(Q3)-EC*cosd(Q4+tED)-AE;
    F(2) = AB*sind(Q2)+BC*sind(Q3)-EC*sind(Q4+tED);
    F(3) = ED*cosd(Q4)-DF*cosd(Q6)-EF;
    F(4) = ED*sind(Q4)-DF*sind(Q6);
end

function [y0,y1,px,py] = drawL(x,P1,P2,P3,P4)
    m = [(P1(2)-P2(2))/(P1(1)-P2(1)+eps),(P3(2)-P4(2))/(P3(1)-P4(1)+eps)];
    y0 = m(1)*(x-P2(1))+P2(2);
    y1 = m(2)*(x-P4(1))+P4(2);
    px = (m(1)*P1(1)-m(2)*P4(1)+P4(2)-P1(2))/(m(1)-m(2)+eps);
    py = m(2)*(px-P4(1))+P4(2);
end

function [y0,y1,px,py] = drawLInf(x,P1,P2,P3,P4)
    m = [(P1(2)-P2(2))/(P1(1)-P2(1)+eps),tand(atand((P3(2)-P4(2))/(P3(1)-P4(1)+eps))+90)];
    y0 = m(1)*(x-P2(1))+P2(2);
    y1 = m(2)*(x-P4(1))+P4(2);
    px = (m(1)*P1(1)-m(2)*P4(1)+P4(2)-P1(2))/(m(1)-m(2)+eps);
    py = m(2)*(px-P4(1))+P4(2);
end

function [y0,y1,px,py] = drawLEq(x,P1,P2,P3,P4,P5)
    m = [(P1(2)-P2(2))/(P1(1)-P2(1)+eps),tand(atand((P3(2)-P4(2))/(P3(1)-P4(1)+eps))+90)];
    y0 = m(1)*(x-P2(1))+P2(2);
    y1 = m(2)*(x-P5(1))+P5(2);
    px = (m(1)*P1(1)-m(2)*P5(1)+P5(2)-P1(2))/(m(1)-m(2)+eps);
    py = m(2)*(px-P5(1))+P5(2);
end
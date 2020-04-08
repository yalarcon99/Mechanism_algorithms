function F = NonLSolver(x,y)
    
    F(1) = BC*cosd(theta_bc)+CD*cosd(x)+O6D*cosd(y)-O6B;
    F(2) = BC*sind(theta_bc)+CD*sind(x)+O6D*sind(y)-O6B;
end


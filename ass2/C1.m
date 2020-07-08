clc
clear
sprintf('getting the root of x^2-4')

x=1; %initial iteration
i=0; %count
tol=100;

while(tol > 1e-12)
    
    y=x.^2-4;
    
    dy=2*x;
    
    Newx = x-y/dy;
    
    tol = abs(x-Newx);
    
    x = Newx;
    
    i = i+1;
    
    error= abs(2-Newx);
    
    sprintf('%2.0d , %3.12f , %3.12f',i,Newx,error)
    
end
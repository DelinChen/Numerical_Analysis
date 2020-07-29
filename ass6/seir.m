function  yprime = seir(t,y, par)
    if par.rzero == 0
        rtable = par.rtable;
        t_val = max( rtable(1,1), min( t, rtable(length(rtable),1)) );
        R_zero = interp1( rtable(:,1), rtable(:,2), t_val);
    else
        R_zero = par.rzero;
    end
    alpha = par.alpha;
    gamma = par.gamma;
    beta = R_zero.*gamma; 
    N = par.N;
    
    yprime = zeros(4,1);
    yprime(1) = -beta*y(1)*y(3)/N;
    yprime(2) = +beta*y(1)*y(3)/N - alpha*y(2);
    yprime(3) = +alpha*y(2) -gamma*y(3);
    yprime(4) = gamma*y(3);
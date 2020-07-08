function [y,edloss,nn] = expseries(x);
% Homework 1, Problem 1.1
% Implement evaluation of exp(x) by a truncated Taylor series
% y = value, edloss = estimated precision loss, nn=truncation index
tol = eps; go=1; n=0; y=1; term=1; %tolerance = machine precision
while go 
  yp = y; 
  n=n+1; term = x*term/n; %next term in Taylor series
  y = y + term;
  go = abs(term)>tol | abs(term)>tol*(abs(y)+abs(yp));
end
if nargout>1, 
    if x<0,
    edloss=(2*abs(x)-log(abs(x))/2 - 1.612)/log(10);
    else edloss=0.125; end;
end;
if nargout>2, nn=n+1; end;
%END

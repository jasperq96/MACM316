function [root, niter, xlist] = secant( func, xint, tol )
% SECANT: Secant method for solving a nonlinear equation.
%
%  Sample usage:
%    [root, niter, xlist] = secant( func, xint, tol )
%
%  Input:
%     func  - function to be solved
%     xint  - interval [xleft,xright] bracketing the root
%     tol   - convergence tolerance (OPTIONAL, defaults to 1e-6)
%
%  Output:
%     root  - final estimate of the root
%     niter - number of iterations required to converge
%     xlist - list of iterates, an array of length 'niter'

% First, do some checking on the input parameters:
if nargin < 2
  fprintf(1, 'SECANT: must be called with at least two arguments' );
  error( 'Usage:  [root, niter, xlist] = secant( func, xint, [tol] )' );
end
if length(xint) ~= 2, error( 'Parameter ''xint'' must be a vector of length 2.' ), end  
if nargin < 3, tol = 1e-6; end   % default value for 'tol'
% fcnchk(...) allows a string function to be sent as a parameter, and
% coverts it to the correct type to allow evaluation by feval().
func = fcnchk(func);

a = xint(1); b = xint(2);
c = b;
% Always start with f(a) > f(b)
fa = feval( func, a );
fb = feval( func, b );
if( fa < fb ) 
  ta  = a;   a = b;   b = ta;   % swap a and b
  tfa = fa; fa = fb; fb = tfa;  % swap f(a) and f(b)
end

xlist = [ a; b ]; 
niter = 0;

while( abs(a-b) > tol )     % absolute error tolerance 
  % Compute the point where the secant line joining 
  % a and b intersects the x-axis 
  c  = b - fb * (a-b) / (fa-fb);
  fc = feval( func, c );
  xlist = [ xlist; c ];     % accumulate list of x-values
  a = b;  fa = fb;
  b = c;  fb = fc;
  niter = niter + 1;
end

root = c;
%END secant.

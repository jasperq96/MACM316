function [root, iter, xlist] = mod_newton( func, pfunc, ppfunc, xguess, tol)
%NEWTON     Newton's method for solving a nonlinear equation.
%
%   Sample usage:
%     [root, niter, xlist] = newton( func, pfunc, xguess, [tol])
%
%   Input:
%     func   - function to be solved
%     pfunc  - derivative of 'func'
%     ppfunc - derivative of 'pfunc', second derivative of 'func'
%     xguess - initial guess at root
%     tol    - convergence tolerance (OPTIONAL, defaults to 1e-6)
%     mult   - factor for multiple roots (OPTIONAL, defaults to 1.0) (NOT NEEDED)
%
%   Output:
%     root   - final estimate of the root 
%     niter  - number of iterations until converged
%     xlist  - list of iterates, an array of length 'niter'

% First, do some error checking on parameters.
if nargin < 4
  fprintf(1, 'NEWTON: must be called with at least three arguments' );
  error( 'Usage:  [root, niter, xlist] = newton( func, pfunc, xguess, [tol], [mult] )' );
end
if nargin < 5, tol  = 1e-6; end
%if nargin < 5, mult = 1.0;  end
% fcnchk(...) converts function parameters to the correct type 
% to allow evaluation by feval().
func = fcnchk( func );
pfunc= fcnchk( pfunc );
ppfunc = fcnchk( ppfunc );

x    = xguess;
fx   = feval( func,  x );
fpx  = feval( pfunc, x );
fppx = feval( ppfunc, x);
if( fx == 0 | fpx == 0 | fppx == 0) 
  error( 'NEWTON: both f and f'' must be non-zero at the initial guess' );
end

xlist= [ x ];
done = 0;
iter = 0;
while( ~done )
  x0  = x;
  x   = x0 - (fx*fpx) / ((fpx^2)-(fx*fppx));
  fx  = feval( func,  x );
  fpx = feval( pfunc, x );
  fppx = feval( ppfunc, x);
  if( abs(x-x0) < tol )     % absolute tolerance on x
    done = 1;
  else
    xlist = [ xlist; x ];   % add to the list of x-values 
    iter  = iter + 1;
  end
end

root = x;
%END newton.
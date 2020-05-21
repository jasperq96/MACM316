f=@(x)((x-1).^2)*exp(x);
df = @(x) exp(x)*(x^2-1);
[root, niter, xlist] = newton( f, df, 2);
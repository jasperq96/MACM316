f=@(x)((x-1).^2)*exp(x); %a
df = @(x) exp(x)*(x^2-1);
[root, niter, xlist] = newton( f, df, 2);
error = abs(xlist - 1);%b
plot(log(error(2:end,1)),log(error(1:end-1,1)));
title('Absolute Errors E_k_+_1 versus E_k using log-log scale');
ylabel('E_k_+_1');
xlabel('E_k');
polyfit(log(error(11:end-1,1)),log(error(12:end,1)),1)
f = @(x)((x-1)^2)*exp(x);%c
pf = @(x)exp(x)*(x^2 - 1);
ppf = @(x)exp(x)*(x^2 + 2*x - 1);
[root,niter,list]=mod_newton(f,pf,ppf,2);
error = abs(list - 1);
plot(log(error(2:end,1)),log(error(1:end-1,1)))
title('Absolute Errors E_k_+_1 versus E_k using log-log scale');
ylabel('E_k_+_1');
xlabel('E_k');
polyfit(log(error(1:end-1,1)),log(error(2:end,1)),1)
f=@(x)cos(x)+(1/(1+exp(2*x)));
g=@(x)acos(-1/(1+exp(2*x)));
[xfinal, niter, xlist] = fixedpt(g,-3);

hold on
fplot(f, [-15 15]);
fplot(g, [-15 15]);
xline(xfinal);
yline(0);
hold off
title("f(x) compared to fixed point g(x)")
xlabel("X Value");ylabel("Y Value");
legend({'f(x): cos(x)+(1/(1+exp(2*x))))','g(x): acos(-1/(1+exp(2*x))'},'location','southwest');
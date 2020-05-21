f=@(x) cos(x)+(1/(1+exp(2*x))); %A Code
fplot(f, [-15 15]);
yline(0);
title("Graph of cos(x)+^{1}/_{1+e^2^x}")
xlabel("X Value");ylabel("Y Value");
legend('cos(x)+(1/(1+e^2^x))','location','southwest')

f=@(x) cos(x)+(1/(1+8.^x)); %B Code
hold on
fplot(cos(x)+(1/(1+exp(2*x))), [-15 15],'green')
fplot(cos(x)+(1/(1+8.^x)), [0 15],'red') %this is for positive x interval
fplot(cos(x)+(1/(1+8^x)), [-15 0], 'blue') % this is for negative x interval
for i = -15:15
    plot(fzero(f,i),0,'.', 'MarkerSize', 10)
end
hold off
title("Graph of cos(x)+^{1}/_{1+e^2^x}");xlabel("X Value");ylabel("Y Value");
legend({'f(x): cos(x)+(1/(1+e^2^x))','approx. f(x): cos(x)+(1/(1+8.^x)) [0,15]','approx. f(x): cos(x)+(1/(1+8.^x)) [-15,0]'},'location','northeast')

f1=@(x)cos(x)+(1/(1+exp(2*x))); %C/D Code
f2=@(x)cos(x)+(1/(1+8.^x));
[root1, niter1, rlist1]=bisect2(f1,[0 5])%C
[root2, niter2, rlist2]=bisect2(f2,[0 5])%C
[root3, niter3, rlist3]=bisect2(f1,[-5 -3])%D
[root4, niter4, rlist4]=bisect2(f2,[-5 -3])%D

f=@(x)cos(x)+(1/(1+exp(2*x))); %E Code
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
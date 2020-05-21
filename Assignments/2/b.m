%syms x y;
%limit(1/(1+exp(2*x)),x,inf,'left') % should be equal to 1, but show ups as 0.
%limit(1/(1+exp(2*x)),x,inf) % should be equal to 0, works

%fplot(cos(x)+1,[-15 15],'red') % Tian,s solution

%make sure to explain how you came up with 8.^x
f=@(x) cos(x)+(1/(1+8.^x));

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

%When finding a "simpler" limit function, I took into account that e is
%approximately 3. Using that as a base, I changed the exponential to a
%constant to the power of x. From trial-and-error, I found that 8^x was
%relatively close to the original. The zeroes on (insert my equation) to
%(insert original equation) are approximations.
f=@(x) cos(x)+(1/(1+exp(2*x)));
fplot(f, [-15 15]);
yline(0);
title("Graph of cos(x)+^{1}/_{1+e^2^x}")
xlabel("X Value")
ylabel("Y Value")
legend('cos(x)+(1/(1+e^2^x))','location','southwest')

%There are two behaviours to this equation depending on the x value. The
%more positive x gets, the fractional expression in our equation gets
%closer and closer to 0. This essentially reflects the graph of cos(x). The
%more negative we get, the denominator in our fraction gets closer to 1.
%This makes the graph closely reflect the appearance of cos(x)+1. The roots
%from left to right are (note that the 2nd and 3rd root are very close as
%the function just dips below 0 before quickly coming back up): 
%[-9.425,0] [-3.2,0] [-3.076,0] [1.609,0] [4.712,0]
%[7.854,0] [11,0] [14.14,0]
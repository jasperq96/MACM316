%Alpha (y-inter) = 0.5543 from polyfit
%P (slope) = 0.9859
%Using variables from (a)

error = abs(xlist - 1);
plot(log(error(2:end,1)),log(error(1:end-1,1)));
title('Absolute Errors E_k_+_1 versus E_k using log-log scale');
ylabel('E_k_+_1');
xlabel('E_k');
polyfit(log(error(11:end-1,1)),log(error(12:end,1)),1) %returns slope and y-inter
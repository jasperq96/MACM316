hold on
for n=1:6
    r=randi([1 4],1,1);
    f=@(x) (x-2).^n;
    if r==1 
        fplot(f,[0 4])
    elseif r==2
        fplot(f,[0 4],'--')
    elseif r==2
        fplot(f,[0 4],':')
    else
        fplot(f,[0 4],'-.')
    end
end
title("Plot of (x-2)^n")
xlabel("x values")
ylim([-2 2])
legend({'(x-2)^1','(x-2)^2','(x-2)^3','(x-2)^4','(x-2)^5','(x-2)^6'},'Location','north')
hold off
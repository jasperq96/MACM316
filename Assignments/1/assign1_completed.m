hold on %Question 1
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
ylabel("y values")
ylim([-2 2])
legend({'(x-2)^1','(x-2)^2','(x-2)^3','(x-2)^4','(x-2)^5','(x-2)^6'},'Location','north')
hold off
interval=[0.5 0.1 0.05 0.025 0.01 0.005];%Question 3
for i=1:6
    subplot(2,3,i)
    hold on
    for n=1:6
        r=randi([1 4],1,1);
        f=@(x) exp_form(x,2,n);
        if r==1
            fplot(f,[2-interval(i) 2+interval(i)])
        elseif r==2
            fplot(f,[2-interval(i) 2+interval(i)],'--')
        elseif r==2
            fplot(f,[2-interval(i) 2+interval(i)],':')
        else
            fplot(f,[2-interval(i) 2+interval(i)],'-.')
        end
    end
    title(["Plot of (x-2)^n with ",interval(i)," intervals"])
    xlabel("x values")
    ylabel("y values")
    legend({'(x-2)^1','(x-2)^2','(x-2)^3','(x-2)^4','(x-2)^5','(x-2)^6'},'Location','southeast')
    hold off
end
figure()
int=[0.5 0.05 0.005];
f=@(x)exp_form(x,2,4);
g=@(x)exp_form(x,2,5);
for i=1:3
   subplot(2,3,i)
   fplot(f,[2-int(i) 2+int(i)])
   title(["Plot of (x-2)^4 with ",int(i), " intervals"])
   xlabel("x values")
   ylabel("y values")
   legend("(x-2)^4",'location','north')
   subplot(2,3,i+3)
   fplot(g,[2-int(i) 2+int(i)])
   title(["Plot of (x-2)^5 with ",int(i), " intervals"])
   xlabel("x values")
   ylabel("y values")
   legend("(x-2)^5",'location','north')
end
function eq = exp_form(x,a,n) %Question 2
    if n<0
        eq = 'n must be 0 or greater';
    else
        total = 0.0;
        for k=0:n
            bi_coef = nchoosek(n,k);
            total = total + ((bi_coef)*(x^(n-k))*(-a)^k);
        end
        eq=total;
    end
end
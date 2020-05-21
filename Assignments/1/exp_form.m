function eq = exp_form(x,a,n)
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
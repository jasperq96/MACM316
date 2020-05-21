F = 0.005;L = 10;n = [100,1000];
time = zeros(4,2);normal = zeros(4,2);
for i=1:2
    h = L/n(i);
    b = zeros(n(i),1);
    init_guess = ones(n(i),1);
    c=1;
    for x=1:n(i)
        b(x)= F*(h^4);
    end
    e = ones(n(i),1);
    Asparse = spdiags([e -4*e 6*e -4*e e],-2:2,n(i),n(i));
    Asparse(1,1)=9; Asparse(n(i),n(i))=1;Asparse(n(i),n(i)-1)=-2;Asparse(n(i)-1,n(i))=-2;Asparse(n(i)-1,n(i)-1)=5;
    Adense = full(Asparse);
    tic;z1 = Asparse\b;time(c,i) = toc;   % Question a
    normal(c,i) = norm(z1);
    c = c + 1;
    tic;z2 = Adense\b;time(c,i) = toc;
    normal(c,i) = norm(z2);
    c = c + 1;
    tic;[sol, niter] = gs2( Asparse, b, init_guess, 1e-8, 1e5 );time(c,i) = toc; %worst
    normal(c,i) = norm(sol); c = c + 1;
    U = spdiags([e -2*e e],0:2,n(i),n(i));% Question b
    U(1,1) = 2;
    UT = transpose(U);
    tic;
    forward = U \ b; backward = UT \ forward;
    time(c,i) = toc;
    normal(c,i) = norm(backward);
end
cond_num_As = condest(Asparse);cond_num_Ad = cond(Adense);cond_num_U = condest(U);% Question c
EI = F*(L^4)/(6*max(z2));% Question d
f = @(x)(F*(x^4)/(6*max(EI)));
fplot(f,[1 100])
title("Maximum elastic beam deflection");
ylabel("Maximum Elastic Beam Deflection ");
xlabel("Length of Beam");

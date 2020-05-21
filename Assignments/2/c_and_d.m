%[root, niter, rlist] = bisect2( func, xint, tol )
f1=@(x)cos(x)+(1/(1+exp(2*x)));
f2=@(x)cos(x)+(1/(1+8.^x));

%c
[root1, niter1, rlist1]=bisect2(f1,[0 5]) %actual function, comes out with root 1.6093
[root2, niter2, rlist2]=bisect2(f2,[0 5]) %approximation function, comes out with root 1.6051
%the approximation is good to 3 decimal places.

%d
[root3, niter3, rlist3]=bisect2(f1,[-5 -3]) %actual function, comes out with root -3.1992
[root4, niter4, rlist4]=bisect2(f2,[-5 -3]) %approximation function, comes out with root -3.1927
% Looking at the graph, you can tell the root lies between -3 and -5. Using
% these as initial parameters, the approximation compared to the solution
% is off by around 0.0065.
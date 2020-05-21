% GERANDOM:  Gaussian Elimination for a random matrix.
% Compute the mean solution error over 'Mtry' trials for
% the system A*x = b, where A is a random NxN matrix and 
% x is an N-vector (containing only 1's).

% YOU NEED MODIFY THIS CODE FOR COMPUTING ASSIGNMENT 4

N    = 500;           % Matrix size
Mtry = 1000;           % Number of trials -- CHANGE THIS!
Elist = zeros(1,N);    % Holds Average errors for matrix size N in index N
for n = 1:N
    x = ones(n,1);         % Exact solution
    errs = zeros(Mtry, 1); % Vector of errors
    for i = 1 : Mtry
      A = 2*rand(n,n)-1;   % Random NxN matrix with entries in [-1, 1] 
      b = A*x;             % Right-hand side vector
      y = A \ b;           % Approximate solution from GE
      errs(i) = max(abs(y-x)); % Max-norm error in y
    end

    % Compute mean and standard deviation of the error
    mean_err = mean(errs);
    Elist(n) = mean_err;
    sdev_err = sqrt(var(errs));

    % Plot the errors on a semi-log scale
%     subplot(2,N/2,n)
%     semilogy(1:Mtry, errs)
%     title(['Error from ' num2str(Mtry) ' solves with a ', ...
%            num2str(n) 'x' num2str(n) ' random matrix'])
%     xlabel('M (trial number)')
%     ylabel('Error')
%     grid on, shg

    %For tracking Purposes
    if(mod(n,100)==0)
        disp(n); 
    end
end
%Plot the Errors Vs. Matrix Size
figure()
loglog(1:N,Elist,'-o')
xlabel('Matrix Size')
ylabel('Mean Error')
%Best Fit line
p = polyfit(1:N,Elist,1);
eqn = @(t)p(1)*t+p(2);
hold on
fplot(eqn,[1 N])
hold off
eqn = @(t)p(1)*t+p(2)==1;
eval(solve(eqn)) %Estimates how Big a N for EN* to be approximately 1


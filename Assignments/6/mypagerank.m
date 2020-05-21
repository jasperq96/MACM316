% Estimate the PageRank for a small web connectivity
% matrix using the power method.
for p=0:.1:1
      % "teleport" probability p = 0.85

    % Set up the connectivity matrix using index
    % vectors that define the from-to connections
    % between pages numbered 1 to n.
    n = 6;      % number of pages
    ii = [2 4 3 6 1 4 6 2 5 2 6 3]; % to-index (row)
    jj = [1 1 2 2 3 3 3 4 4 5 5 6]; % from-index (column) 3 -> 1
    G = sparse(ii, jj, 1, n, n);

    c = full(sum(G));  % column sums
    e = ones(n,1);
    k = find(c~=0);    % indices of zero columns 
    D = sparse(k, k, 1./c(k), n, n);
    z = ((1-p)*(c~=0) + (c==0)) / n;

    A = p*G*D + e*z;   % PageRank matrix

    x = e/n;           % initial guess
    xold = zeros(n,1);
    niter = 0;
    while norm(x-xold) > 0.0001,
      niter = niter + 1;
      xold = x;
      x = A*x;
    end
    x, niter, p
    nexttile
    bar(x), shg    % plot ranks as a bar plot
    title(["Page Ranking with P = ", p]);
    xlabel("Page ");
    ylabel("Rank");
end



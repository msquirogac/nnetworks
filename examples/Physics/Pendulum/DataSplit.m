function [Xt, Yt, Xv, Yv] = DataSplit(X, n)
Xt = X(2:end,:,n+1:end);
Xv = X(2:end,:,1:n);
Xt(:,2:end,:) = repmat(Xt(1,2:end,:), size(Xt,1),1,1);
Xv(:,2:end,:) = repmat(Xv(1,2:end,:), size(Xv,1),1,1);

Yt = X(2:end,2:end,n+1:end);
Yv = X(2:end,2:end,1:n);
C = permute(Yt,[1 3 2]);
Yt = reshape(C,[],size(Yt,2),1);
C = permute(Yv,[1 3 2]);
Yv = reshape(C,[],size(Yv,2),1);

C = permute(Xt,[1 3 2]);
Xt = reshape(C,[],size(Xt,2),1);
C = permute(Xv,[1 3 2]);
Xv = reshape(C,[],size(Xv,2),1);
function [I,rect] = SRAD(I,niter,lambda,rect)
% make image a double and normalize
I = double(I);
mx = max(I(:));
mn = min(I(:));
I = (I-mn)/(mx-mn);

% indices (using boudary conditions)
[M,N] = size(I);
iN = [1, 1:M-1];
iS = [2:M, M];
jW = [1, 1:N-1];
jE = [2:N, N];

% get area of uniform speckle
if nargin < 4 || isempty(rect)
    figure, imshow(I,[],'InitialMagnification','fit');
    rect = getrect;
    close;
end

%log uncompress and eliminate zero value pixels.
I = exp(I);

% wait bar
hwait = waitbar(0,'Filtering Image...');


% main algorithm
for iter = 1:niter

    % speckle scale function
    Iuniform = imcrop(I,rect);
    q0_squared = (std(Iuniform(:))/mean(Iuniform(:)))^2;

    % differences
    dN = I(iN,:) - I;
    dS = I(iS,:) - I;
    dW = I(:,jW) - I;
    dE = I(:,jE) - I;

    % normalized discrete gradient magnitude squared (equ 52,53)
    G2 = (dN.^2 + dS.^2 + dW.^2 + dE.^2) ./ (I.^2 + eps);

    %normalized discrete laplacian (equ 54)
    L = (dN + dS + dW + dE) ./ (I + eps);

    % ICOV (equ 31/35)
    num = (.5*G2) - ((1/16)*(L.^2));
    den = (1 + ((1/4)*L)).^2;
    q_squared = num ./ (den + eps);

    % diffusion coefficent (equ 33)
    den = (q_squared - q0_squared) ./ (q0_squared *(1 + q0_squared) + eps);
    c = 1 ./ (1 + den);
    cS = c(iS, :);
    cE = c(:,jE);

    % divergence equ 58
    D = (cS.*dS) + (c.*dN) + (cE.*dE) + (c.*dW);

    % update (equ 61)
    I = I + (lambda/4)*D;

    % update waitbar
    waitbar(iter/niter,hwait);

    % display
    %     if ~mod(iter,10)
    %         figure(fig)
    %         imshow(I,[],'notruesize')
    %         title(sprintf('Iteration %d',iter));
    %         pause(eps)
    %     end


end

I = log(I);
I = uint8(round(I.*255));
% figure, imshow(I);
% close wait bar
close(hwait)



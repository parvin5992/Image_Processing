function q = guidedfilter_color(I, p, r, eps)

[hei, wid] = size(p);
N = boxfilter(ones(hei, wid), r); 

mean_I_r = boxfilter(I(:, :, 1), r) ./ N;
mean_I_g = boxfilter(I(:, :, 2), r) ./ N;
mean_I_b = boxfilter(I(:, :, 3), r) ./ N;

mean_p = boxfilter(p, r) ./ N;

mean_Ip_r = boxfilter(I(:, :, 1).*p, r) ./ N;
mean_Ip_g = boxfilter(I(:, :, 2).*p, r) ./ N;
mean_Ip_b = boxfilter(I(:, :, 3).*p, r) ./ N;

% covariance of (I, p) in each local patch.
cov_Ip_r = mean_Ip_r - mean_I_r .* mean_p;
cov_Ip_g = mean_Ip_g - mean_I_g .* mean_p;
cov_Ip_b = mean_Ip_b - mean_I_b .* mean_p;

var_I_rr = boxfilter(I(:, :, 1).*I(:, :, 1), r) ./ N - mean_I_r .*  mean_I_r; 
var_I_rg = boxfilter(I(:, :, 1).*I(:, :, 2), r) ./ N - mean_I_r .*  mean_I_g; 
var_I_rb = boxfilter(I(:, :, 1).*I(:, :, 3), r) ./ N - mean_I_r .*  mean_I_b; 
var_I_gg = boxfilter(I(:, :, 2).*I(:, :, 2), r) ./ N - mean_I_g .*  mean_I_g; 
var_I_gb = boxfilter(I(:, :, 2).*I(:, :, 3), r) ./ N - mean_I_g .*  mean_I_b; 
var_I_bb = boxfilter(I(:, :, 3).*I(:, :, 3), r) ./ N - mean_I_b .*  mean_I_b; 

a = zeros(hei, wid, 3);
for y=1:hei
    for x=1:wid        
        Sigma = [var_I_rr(y, x), var_I_rg(y, x), var_I_rb(y, x);
            var_I_rg(y, x), var_I_gg(y, x), var_I_gb(y, x);
            var_I_rb(y, x), var_I_gb(y, x), var_I_bb(y, x)];
        %Sigma = Sigma + eps * eye(3);
        
        cov_Ip = [cov_Ip_r(y, x), cov_Ip_g(y, x), cov_Ip_b(y, x)];        
        
        a(y, x, :) = cov_Ip * inv(Sigma + eps * eye(3)); 
    end
end

b = mean_p - a(:, :, 1) .* mean_I_r - a(:, :, 2) .* mean_I_g - a(:, :, 3) .* mean_I_b; % Eqn. (15) in the paper;

q = (boxfilter(a(:, :, 1), r).* I(:, :, 1)...
+ boxfilter(a(:, :, 2), r).* I(:, :, 2)...
+ boxfilter(a(:, :, 3), r).* I(:, :, 3)...
+ boxfilter(b, r)) ./ N; 
end
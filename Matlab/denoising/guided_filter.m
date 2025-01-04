function [q] = guided_filter(P,I,r,e)
% output  = filtering output q
% I = guidance image 
% r = radius
% e = regularization 
h = fspecial('average',r);
mean_I = imfilter(I,h,'replicate');
mean_P = imfilter(P,h,'replicate');
I_new = I.*I;
corr_I = imfilter(I_new,h,'replicate');
I_p = I.*P;
corr_IP = imfilter(I_p,h,'replicate');
var_I = corr_I - mean_I.*mean_I;
cov_IP = corr_IP - mean_I.*mean_P;
a = (cov_IP)./(var_I + e);
b = mean_P - a.*mean_I;
mean_a = imfilter(a,h,'replicate');
mean_b = imfilter(b,h,'replicate');
q = (mean_a .*I) + mean_b;
end





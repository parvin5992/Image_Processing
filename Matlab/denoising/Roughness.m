function [out] = Roughness(in,h1,h2)
in = im2double(in);
a1 = conv2(h1,in);
a2 = conv2(h2,in);
b1 = norm(a1,1);
b2 = norm(a2,1);
b3 = norm(in,1);
out = (b1+b2)/b3;
end
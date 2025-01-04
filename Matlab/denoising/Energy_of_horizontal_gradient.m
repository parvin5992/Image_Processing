function [out] = Energy_of_horizontal_gradient(in)
[z1,z2] = size(in);
l = 0;
for i = 1:z1
    for j = 1:z2-1
        a = in(i,j) - in(i,j+1);
        b = (abs(a))^2;
        c = b;
        l = l + c;
    end
end
out = l/(z1*z2);
end

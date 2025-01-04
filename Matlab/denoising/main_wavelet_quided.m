clc
clear
close all

Directory_images='putyour dataset address here';
addpath(genpath(['./' Directory_images]));
images = dir(['./' Directory_images '/*.png']); % its could be any type of images such as .jpg or ... 
h1 = [-1,1];
h2 = [-1;1];
for img=1:numel(images)
    I = imread(['./' Directory_images '/' images(img).name]);
    if size(size(I),2)>2
        I=rgb2gray(I);
    end
I = double(I)/255;
[A1,H1,V1,D1] = dwt2(I,'sym8');  [A2,H2,V2,D2] = dwt2(A1,'sym8');  [A3,H3,V3,D3] = dwt2(A2,'sym8'); 

e = 0.2^2;

sX1 = size(I); sX2 = size(A1); sX3 = size(A2);
r1 = floor(0.7 * sX1(1));
v3_hat = guided_filter(V3,A3,r1,e);
A2_new = idwt2(A3,H3,v3_hat,D3,'sym8',sX3);

r2 = floor(0.7 * sX2(1));
v2_hat = guided_filter(V2,A2_new,r2,e);
A1_new = idwt2(A2_new,H2,v2_hat,D2,'sym8',sX2);

r3 = floor(0.7 * sX3(1));
v1_hat = guided_filter(V1,A1_new,r3,e);
A0_new = idwt2(A1_new,H1,v1_hat,D1,'sym8',sX1);
disp(num2str(Roughness(double(I),h1,h2)));

figure
subplot(1,4,1)
imshow(I); title('input image')
subplot(1,4,2)
imshow(V1,[]); title('vertical component of level 1')
subplot(1,4,3)
imshow(V2,[]); title('vertical component of level 2')
subplot(1,4,4)
imshow(V3,[]); title('vertical component of level 3')
figure
subplot(1,2,1)
imshow(I); title('input image')
subplot(1,2,2)
imshow(A0_new,[]); title('Strip removal results')
pause(2)
close all
end

lpfilt='maxflat';
shear_parameters.dcomp =[3 3];
shear_parameters.dsize =[32 32];
Tscalars=[0 3 4];

for img=1:numel(images)
    x_double = imread(['./' Directory_images '/' images(img).name]);
    if size(size(x_double),2)>2
        x_double=rgb2gray(x_double);
    end
    x_double = double(x_double);
 
    [dst1,shear_f1]=nsst_dec1(x_double,shear_parameters,lpfilt);
    [dst2,shear_f2]=nsst_dec1(dst1,shear_parameters,lpfilt);
    [dst3,shear_f3]=nsst_dec1(dst2,shear_parameters,lpfilt);
    
    dst_new3 = guided_filter(dst3,dst3,r1,e);
    dst_new2 = guided_filter(dst_new3,dst2,r2,e);
    dst_new2 = guided_filter(dst_new2,dst3,r3,e);
    
end



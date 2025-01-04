function dstn=nsst_HTsub(dst,sigma,subbands2,subbands3,subbands4,dst_scalars)
% This function performs hard thresholding of the discrete shearlet
% tranform.
%
% Input:
%
% dst          - the nonsubsampled shearlet coefficients
%
% sigma        - the standard deviation of the noise
%
% Tscalars     - a 1x3 vector containing the threshold scalars 
%                Tscalars(1) is the threshold scalar for the low-pass
%                coefficients
%                Tscalars(2) is the threshold scalar for the band-pass 
%                coefficients
%                Tscalars(3) is the threshold scalar for the high-pass
%                coefficients
%
% dst_scalars  - the cell array containing the scalars of 
%                estimated noise levels for a white Gaussian noise
%                of standard deviation 1 transform coefficients

%
% Output  
% 
% dstn         - the thresheld nonsubsampled shearlet coefficients
%
% Code contributors: Glenn R. Easley, Demetrio Labate, and Wang-Q Lim.
% Copyright 2011 by Glenn R. Easley. All Rights Reserved.
%

level=length(dst)-1;
dstn = cell(1,level+1);
dstn{1}=dst{1};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dstn{2}(:,:,1)=dst{2}(:,:,1).*(abs(dst{2}(:,:,1)) > subbands2(1)*sigma*dst_scalars{2}(1)); 
dstn{2}(:,:,2)=dst{2}(:,:,2).*(abs(dst{2}(:,:,2)) > subbands2(2)*sigma*dst_scalars{2}(2)); 
dstn{2}(:,:,3)=dst{2}(:,:,3).*(abs(dst{2}(:,:,3)) > subbands2(3)*sigma*dst_scalars{2}(3)); 
dstn{2}(:,:,4)=dst{2}(:,:,4).*(abs(dst{2}(:,:,4)) > subbands2(4)*sigma*dst_scalars{2}(4)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dstn{3}(:,:,1)=dst{3}(:,:,1).*(abs(dst{3}(:,:,1)) > subbands3(1)*sigma*dst_scalars{3}(1)); 
dstn{3}(:,:,2)=dst{3}(:,:,2).*(abs(dst{3}(:,:,2)) > subbands3(2)*sigma*dst_scalars{3}(2)); 
dstn{3}(:,:,3)=dst{3}(:,:,3).*(abs(dst{3}(:,:,3)) > subbands3(3)*sigma*dst_scalars{3}(3)); 
dstn{3}(:,:,4)=dst{3}(:,:,4).*(abs(dst{3}(:,:,4)) > subbands3(4)*sigma*dst_scalars{3}(4));
dstn{3}(:,:,5)=dst{3}(:,:,5).*(abs(dst{3}(:,:,5)) > subbands3(5)*sigma*dst_scalars{3}(5)); 
dstn{3}(:,:,6)=dst{3}(:,:,6).*(abs(dst{3}(:,:,6)) > subbands3(6)*sigma*dst_scalars{3}(6)); 
dstn{3}(:,:,7)=dst{3}(:,:,7).*(abs(dst{3}(:,:,7)) > subbands3(7)*sigma*dst_scalars{3}(7)); 
dstn{3}(:,:,8)=dst{3}(:,:,8).*(abs(dst{3}(:,:,8)) > subbands3(8)*sigma*dst_scalars{3}(8));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dstn{4}(:,:,1)=dst{4}(:,:,1).*(abs(dst{4}(:,:,1)) > subbands4(1)*sigma*dst_scalars{4}(1)); 
dstn{4}(:,:,2)=dst{4}(:,:,2).*(abs(dst{4}(:,:,2)) > subbands4(2)*sigma*dst_scalars{4}(2)); 
dstn{4}(:,:,3)=dst{4}(:,:,3).*(abs(dst{4}(:,:,3)) > subbands4(3)*sigma*dst_scalars{4}(3)); 
dstn{4}(:,:,4)=dst{4}(:,:,4).*(abs(dst{4}(:,:,4)) > subbands4(4)*sigma*dst_scalars{4}(4));
dstn{4}(:,:,5)=dst{4}(:,:,5).*(abs(dst{4}(:,:,5)) > subbands4(5)*sigma*dst_scalars{4}(5)); 
dstn{4}(:,:,6)=dst{4}(:,:,6).*(abs(dst{4}(:,:,6)) > subbands4(6)*sigma*dst_scalars{4}(6)); 
dstn{4}(:,:,7)=dst{4}(:,:,7).*(abs(dst{4}(:,:,7)) > subbands4(7)*sigma*dst_scalars{4}(7)); 
dstn{4}(:,:,8)=dst{4}(:,:,8).*(abs(dst{4}(:,:,8)) > subbands4(8)*sigma*dst_scalars{4}(8));
dstn{4}(:,:,9)=dst{4}(:,:,9).*(abs(dst{4}(:,:,9)) > subbands4(9)*sigma*dst_scalars{4}(9)); 
dstn{4}(:,:,10)=dst{4}(:,:,10).*(abs(dst{4}(:,:,10)) > subbands4(10)*sigma*dst_scalars{4}(10)); 
dstn{4}(:,:,11)=dst{4}(:,:,11).*(abs(dst{4}(:,:,11)) > subbands4(11)*sigma*dst_scalars{4}(11)); 
dstn{4}(:,:,12)=dst{4}(:,:,12).*(abs(dst{4}(:,:,12)) > subbands4(12)*sigma*dst_scalars{4}(12));
dstn{4}(:,:,13)=dst{4}(:,:,13).*(abs(dst{4}(:,:,13)) > subbands4(13)*sigma*dst_scalars{4}(13)); 
dstn{4}(:,:,14)=dst{4}(:,:,14).*(abs(dst{4}(:,:,14)) > subbands4(14)*sigma*dst_scalars{4}(14)); 
dstn{4}(:,:,15)=dst{4}(:,:,15).*(abs(dst{4}(:,:,15)) > subbands4(15)*sigma*dst_scalars{4}(15)); 
dstn{4}(:,:,16)=dst{4}(:,:,16).*(abs(dst{4}(:,:,16)) > subbands4(16)*sigma*dst_scalars{4}(16));





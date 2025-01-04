function z=conv2p(X,y)
z=real(ifft2(X.*fft2(y)));

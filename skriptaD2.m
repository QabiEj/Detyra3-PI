C = ones(256:256);
for I = 1:256
    for j = 1:256
        A(I,j) = 27*cos(((pi*I)/2) + ((pi*j)/3))+20*sin(((pi*I)/5) + ((pi*j)/3));
    endfor
endfor

I = imread('lena.tif');
I = im2double(I);
IM = I + A;
imshow(IM);

figure,
FI = fft2(IM);
SFI = fftshift(FI);
mesh(log(abs(SFI)));

figure
imshow(log(abs(SFI)),[]);

for I = 1:256
    for j = 1:256
        if (sqrt((I-64)^2 + (j-86)^2) <= 9)
            C(I,j) = 0;
        endif
        if (sqrt((I-194)^2 + (j-170)^2) <= 9)
            C(I,j) = 0;
        endif
        if (sqrt((I-151)^2 + (j-170)^2) <= 25)
            C(I,j) = 0;
        endif
        if (sqrt((I-100)^2 + (j-84)^2) <= 25)
            C(I,j) = 0;
        endif
    endfor
endfor

C(63:65,:) = 0;
C(100:104, :) = 0;
C(192:194, :) = 0;
C(152:155, :) = 0;
C(:, 84:88) = 0;
C(:,168:173) = 0;

figure,
imshow(C,[]);

figure,
IMM = SFI.*C;
imshow(IMM);

skk = ifftshift(IMM);
imazhi = ifft2(skk);
imshow(imazhi);

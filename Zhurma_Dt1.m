function Y = Zhurma_Dt1(tipi, x, y, z, k, s, a, b)
    Y=-1;          %% Vlere random qe perdoret si koefiecient shumezimi per shperndarjen e caktuar
    pkg load image;
    img = imread('baboon.jpg');
    m = k-x;
    n = z-y;
    switch(tipi)
    case 'rayleigh'         %% Zhurma_Dt1('rayleigh',100,100,400,420,3,0.2,0.4);
      Y = a+sqrt(-b*log(1-rand(m,n)));
      for i = 1:1:(m)
        for j = 1:1:(n)
          for l = 1:1:s
            img(x+i,y+j,l) = img(x+i,y+j,l) + 60*Y(i,j);
          endfor
        endfor
      endfor
    case 'exponential'        %% Zhurma_Dt1('exponential',100,100,400,420,3,0.2,0.4);
      Y = -log(1-rand(m,n))/a;
      for i = 1:1:(m)
        for j = 1:1:(n)
          for l = 1:1:s
            img(x+i,y+j,l) = img(x+i,y+j,l) + 15*Y(i,j);
          endfor
        endfor
      endfor
    case 'lognormal'          %% Zhurma_Dt1('lognormal',100,100,400,420,3,0.2,0.4);
      Y = a*exp(b*randn(m,n));
      for i = 1:1:(m)
        for j = 1:1:(n)
          for l = 1:1:s
            img(x+i,y+j,l) = img(x+i,y+j,l) + 100*Y(i,j);
          endfor
        endfor
      endfor
    case 'salt & pepper'     %% Zhurma_Dt1('salt & pepper',100,100,400,420,3,0.2,0.4);
      Y = img(x:x+m,y:y+n,1:3);
      Y = imnoise(img(x:x+m,y:y+n,1:3),'salt & pepper',0.1);
      for i = 1:1:(m)
        for j = 1:1:(n)
          for l = 1:1:s
            img(x+i,y+j,l) =Y(i,j,l);
          endfor
        endfor
      endfor
      imshow(img,[]);
      
    case 'erlang'              %% Zhurma_Dt1('erlang',100,100,400,420,3,0.2,0.4);          
      Y = -log(1-rand(m,n))/a;
      for i = 2:b
        Y = Y -log(1-rand(m,n))/a;
      endfor
      for i = 1:1:(m)
        for j = 1:1:(n)
          for l = 1:1:s
            img(x+i,y+j,l) = img(x+i,y+j,l) + 15*Y(i,j);
          endfor
        endfor
      endfor
    end
    imshow(img,[]); 
  endfunction

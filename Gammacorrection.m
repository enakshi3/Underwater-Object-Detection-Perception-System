Err = 0;
if nargin >2
    GammaValue = 1;
    disp('Default value for gamma = 1');
    Err=1;
else if nargin==2& GammaValue<0
    GammaValue = 1;
    disp('GammaValue < 0, Default value considered, Gammavalue = 1');
    
else if nargin<2
   disp('Error : Too many input parameters');
    Err = 1;
    end
    end
end
if Err == 1 
x = imread('image1.jpg');
x = double(x);
Correction = 255 * (x/255).^ GammaValue;
disp(Correction);
end
imshow(Correction);

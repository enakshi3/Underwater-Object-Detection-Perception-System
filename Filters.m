function varargout = Filters(varargin)
% FILTERS MATLAB code for Filters.fig
%      FILTERS, by itself, creates a new FILTERS or raises the existing
%      singleton*.
%
%      H = FILTERS returns the handle to a new FILTERS or the handle to
%      the existing singleton*.
%
%      FILTERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTERS.M with the given input arguments.
%
%      FILTERS('Property','Value',...) creates a new FILTERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Filters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Filters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Filters

% Last Modified by GUIDE v2.5 04-Feb-2018 13:31:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Filters_OpeningFcn, ...
                   'gui_OutputFcn',  @Filters_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Filters is made visible.
function Filters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Filters (see VARARGIN)

% Choose default command line output for Filters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Filters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Filters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
axes(handles.axes2)
imshow(img);
title('Input Image');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Correction
% global Laplacian
% H = fspecial('laplacian');
%      %% apply laplacian filter. 
%     Laplacian = imfilter(Correction,H);
% % Correction=rgb2gray(Correction)
% % lap = [1 1 1; 1 -8 1; 1 1 1];
% % Laplacian = uint8(filter2(lap, Correction, 'same'));
% axes(handles.axes1)
% imshow(Laplacian)
% title('Laplacian Image');
global Correction
axes(handles.axes1)
imshow(Correction);
title('Gamma Corrected Image');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Correction
% global Laplacian
% global saliencyMap
% FFT = fft2(Laplacian); 
% LogAmplitude = log(abs(FFT));
% Phase = angle(FFT);
% SpectralResidual = LogAmplitude - imfilter(LogAmplitude, fspecial('average', 3), 'replicate'); 
% saliencyMap = abs(ifft2(exp(SpectralResidual + i*Phase))).^2;
% %% After Effect
% saliencyMap = mat2gray(imfilter(saliencyMap, fspecial('disk', 3)));
% axes(handles.axes3);
% imshow(saliencyMap, []);title('Saliency Map');
% title('Saliency Map');
% global Correction
% global k1
% global k2
% global b1
% global b2
% global b3
% global c1
% global c2
% global c3
% global d1
% global d2
% global d3
% global a2
% global a1
% 
% a=Correction;
% [a1,b1,c1,d1]=dwt2(a,'db2');
% axes(handles.axes3)
% imshow([a1,b1,c1,d1])
% title('Wavelet for Gamma Image');

global sharp
axes(handles.axes3)
imshow(sharp);
title('Sharpened Image');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Correction
% global saturationImage
% saturationImage = zeros(size(Correction));
% axes(handles.axes1);
% imshow(saturationImage)
% global sharp
% global k1
% global k2
% global b1
% global b2
% global b3
% global c1
% global c2
% global c3
% global d1
% global d2
% global d3
% global a2
% 
% b=sharp;
% [a2,b2,c2,d2]=dwt2(b,'db2');
% axes(handles.axes1)
% imshow([a2,b2,c2,d2])
% title('Wavelet for Sharpened Image');
global img
global Correction
global sharp
global imt
global im1
global im2
imt=img;
im1=Correction;
im1=uint8(im1);
im2=sharp;
im1=imresize(im1,[800 800]);
im2=imresize(im2,[800 800]);
imt=imresize(imt,[800 800]);
axes(handles.axes2)
imshow(imt);
title('ORIGINAL IMAGE')

axes(handles.axes1)
imshow(im1);
title('GAMMA IMAGE')

axes(handles.axes3)
imshow(im2);
title('SHARPENED IMAGE')
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imt
global im1
global im2
global k
% global k1
% global k2
% global a1
% global a2
% global a3
% global a4
% 
% 
% [k1,k2]=size(a1);
% 
% 
% %% Fusion Rules
% 
% %% Average Rule
% 
% for i=1:k1
%     for j=1:k2
%         a3(i,j)=(a1(i,j)+a2(i,j))/2;
%    end
% end

prompt = {'Enter Pyramid rate'};
dlg_title = 'Input Correction number';
num_lines= 1;
def = {'15'};
answer  = inputdlg(prompt);

GammaNumber=cell2mat(answer);
GammaNumber=str2double(GammaNumber)

k = GammaNumber; %pyramid levels
% insert images






% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Max Rule
% global k1
% global k2
% global b1
% global b2
% global b3
% global c1
% global c2
% global c3
% global d1
% global d2
% global d3
% 
% 
% 
% 
% for i=1:k1
%     for j=1:k2
%         b3(i,j)=max(b1(i,j),b2(i,j));
%         c3(i,j)=max(c1(i,j),c2(i,j));
%         d3(i,j)=max(d1(i,j),d2(i,j));
%     end
% end
% 
%

global im1
global im2
global imf
global k

figure(1);
imshow(im1,[]);
figure(2);
imshow(im2,[]);
% fusion will start here
imf = uint8(DCTcIFlp(double(im1),double(im2),k));
%display only
figure(3);
imf=imresize(imf,[400 400]);
imshow(imf,[]);     

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global a3
% global b3
% global c3
% global d3
% global Correction
% global a
% global b
% global c
% global sharp
% a=Correction
% b=sharp
% c=idwt2(a3,b3,c3,d3,'db2');
% figure,imshow(a);
% title('First Image')
% figure,imshow(b);
% title('Second Image')
% figure,imshow(c,[]);
% title('Fused Image');
global img
global Correction
global sharp
global imf
img=imresize(img,[194 194]);
Correction=imresize(Correction,[194 194]);
sharp=imresize(sharp,[194 194]);
imf=imresize(imf,[194 194]);
imf=hist_eq(imf);
image=imf;
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);
    %Get histValues for each channel
    [yRed, x] = imhist(Red);
    [yGreen, x] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    %Plot them together in one plot
    figure,
    plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
figure;
subplot(1,4,1),imshow(img);
title('Original Image');
subplot(1,4,2),imshow(Correction);
title('Gamma Corrected Image');
subplot(1,4,3),imshow(sharp);
title('Sharpened Image');

subplot(1,4,4),imshow(imf);
title('Fused Image');
disp(size(img));
disp(size(Correction));
disp(size(sharp));
disp(size(imf));

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imt
global im1
global im2
global imf
a=rgb2gray(im1);
b=rgb2gray(im2);
c=rgb2gray(imf);
a=imresize(a,[400 400]);
b=imresize(b,[400 400]);
c=imresize(c,[400 400]);
CR1=corr2(a,c);
CR2=corr2(b,c);
S1=snrr(double(a),double(c));
S2=snrr(double(b),double(c));


fprintf('Correlation between first image and fused image =%f \n\n',CR1);
fprintf('Correlation between second image and fused image =%f \n\n',CR2);
fprintf('SNR between first image and fused image =%4.2f db\n\n',S1);
fprintf('SNR between second image and fused image =%4.2f db \n\n',S2);

set(handles.edit1, 'String', CR1);
set(handles.edit2, 'String', CR2);
set(handles.edit3, 'String', S1);
set(handles.edit4, 'String',S2);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global Correction
global sharp
global imf
imt=img;
im1=Correction;
im1=uint8(im1);
im2=sharp;
im1=imresize(im1,[400 400]);
im2=imresize(im2,[400 400]);
imt=imresize(imt,[400 400]);
k = 2; %pyramid levels
% insert images

figure(1);
imshow(im1,[]);
figure(2);
imshow(im2,[]);
% fusion will start here
imf = uint8(DCTcIFlp(double(im1),double(im2),k));
%display only
figure(3);
imshow(imf,[]);     
imd = imt-imf;
figure(4)
imshow(imd,[]);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

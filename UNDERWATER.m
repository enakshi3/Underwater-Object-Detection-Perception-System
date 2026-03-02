function varargout = UNDERWATER(varargin)
% UNDERWATER MATLAB code for UNDERWATER.fig
%      UNDERWATER, by itself, creates a new UNDERWATER or raises the existing
%      singleton*.
%
%      H = UNDERWATER returns the handle to a new UNDERWATER or the handle to
%      the existing singleton*.
%
%      UNDERWATER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNDERWATER.M with the given input arguments.
%
%      UNDERWATER('Property','Value',...) creates a new UNDERWATER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UNDERWATER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UNDERWATER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UNDERWATER

% Last Modified by GUIDE v2.5 03-Feb-2018 13:08:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UNDERWATER_OpeningFcn, ...
                   'gui_OutputFcn',  @UNDERWATER_OutputFcn, ...
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


% --- Executes just before UNDERWATER is made visible.
function UNDERWATER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UNDERWATER (see VARARGIN)

% Choose default command line output for UNDERWATER
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UNDERWATER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UNDERWATER_OutputFcn(hObject, eventdata, handles) 
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
img=uigetfile('D:\2017-18\2017-18\PROJECTS\IMAGE\UNDERWATER_IMAGE\UNDEWATER\*.jpg')
img=imread(img);
axes(handles.axes1)
imshow(img)
title('ORIGINAL IMAGE')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global red
% si=ndims(img);
% if(si>2)    
% gray=rgb2gray(img);
% else
%     gray=img;
% end
red = img(:,:,1);
axes(handles.axes2);
imshow(red);
title('Red Image');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global red
axes(handles.axes3);
imhist(red);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global red
global b
b= histeq(red);
axes(handles.axes2);
imshow(b);
title('EQUALIZED IMAGE');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b
global img
global red
global C
C = imfuse(img,red,'blend','Scaling','joint');
axes(handles.axes3);
imshow(C);
title('FUSED IMAGE')

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C
global d
d= imadjust(C,[0.2 0.5],[]);
axes(handles.axes2);
imshow(d);
title('COMPENSATED IMAGE')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Grey_Edge
global img
global L
global max_luminosity
global srgb2lab 
global lab2srgb
srgb2lab = makecform('srgb2lab');
lab2srgb = makecform('lab2srgb');
shadow=img;
shadow_lab = applycform(shadow, srgb2lab); % convert to L*a*b*

% the values of luminosity can span a range from 0 to 100; scale them
% to [0 1] range (appropriate for MATLAB(R) intensity images of class double) 
% before applying the three contrast enhancement techniques
max_luminosity = 100;
L = shadow_lab(:,:,1)/max_luminosity;

% % % % % % % % % % % % % % % % % % % % % % % % GREY WORLD% % % % % % % % % % % % % % % % 
% replace the luminosity layer with the processed data and then convert
% the image back to the RGB colorspace


Grey_Edge = shadow_lab;
Grey_Edge(:,:,1) = imadjust(L)*max_luminosity;
Grey_Edge = applycform(Grey_Edge, lab2srgb);
axes(handles.axes3);
imshow(Grey_Edge);
title('GREY EDGE')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Hist
global srgb2lab 
global lab2srgb
global Max_RGB
global L
global max_luminosity
global C

Max_RGB = max(C,100);
axes(handles.axes2);
imshow(Max_RGB);
title('MAX RGB')

Hist = Max_RGB;
Hist(:,:,1) = histeq(L)*max_luminosity;
Hist = applycform(Hist, lab2srgb);

axes(handles.axes3);
imshow(Hist);
title('HIST EQUALIZED')


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Hist
global Adaptive
global srgb2lab 
global lab2srgb
global L
global max_luminosity
Adaptive = Hist;
Adaptive(:,:,1) = adapthisteq(L)*max_luminosity;
Adaptive = applycform(Adaptive, lab2srgb);

axes(handles.axes2);
imshow(Adaptive);
title('ADAPTIVE HISTOGRAM')


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Adaptive
global white
global C
Balance = rgb2gray(Adaptive); % Convert to gray so we can get the mean luminance.
% Extract the individual red, green, and blue color channels.
redChannel = C(:, :, 1);
greenChannel = C(:, :, 2);
blueChannel = C(:, :, 3);
meanR = mean2(redChannel);
meanG = mean2(greenChannel);
meanB = mean2(blueChannel);
meanGray = mean2(Balance);

% Make all channels have the same mean
redChannel = uint8(double(redChannel) * meanGray / meanR);
greenChannel = uint8(double(greenChannel) * meanGray / meanG);
blueChannel = uint8(double(blueChannel) * meanGray / meanB);
% Recombine separate color channels into a single, true color RGB image.
white = cat(3, redChannel, greenChannel, blueChannel);


axes(handles.axes3);
imshow(white);
title('White Balanced Image')


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global red
global b
global C
global d
global Grey_Edge
global Max_RGB
global Hist
global Adaptive
global white
figure;
subplot(2,5,1),imshow(img);
title('Original Image');
subplot(2,5,2),imshow(red);
title('Red Channel');
subplot(2,5,3),imshow(b);
title('Red Equalized');
subplot(2,5,4),imshow(C);
title('Original with Equalized');
subplot(2,5,5),imshow(d);
title('Compensated Image');  

subplot(2,5,6),imshow(Grey_Edge);
title('Grey Edge');


subplot(2,5,7),imshow(Hist);
title('Histogram Equalized');
subplot(2,5,8),imshow(Adaptive);
title('Adaptive Histogram');
subplot(2,5,9),imshow(white);
title('White Balanced Image');


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global white
global Correction
prompt = {'Enter Gamma Correction rate'};
dlg_title = 'Input Correction number';
num_lines= 1;
def = {'15'};
answer  = inputdlg(prompt);

GammaNumber=cell2mat(answer);
GammaNumber=str2double(GammaNumber)
Err = 0;
if nargin >2
    GammaValue = 0;
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
x = white;
x = double(x);
a=12;
Correction = 255 * (x/255).^ GammaNumber;

end
axes(handles.axes2);
imshow(Correction);
title('Gamma Corrected Image');
figure,imshow(Correction);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global white
global sharp
sharp = imsharpen(white)
axes(handles.axes3)
imshow(sharp);
title('Sharpened Image')


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
Filters();

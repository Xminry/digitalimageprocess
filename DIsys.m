function varargout = DIsys(varargin)
% DISYS MATLAB code for DIsys.fig
%      DISYS, by itself, creates a new DISYS or raises the existing
%      singleton*.
%
%      H = DISYS returns the handle to a new DISYS or the handle to
%      the existing singleton*.
%
%      DISYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISYS.M with the given input arguments.
%
%      DISYS('Property','Value',...) creates a new DISYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIsys_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIsys_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIsys

% Last Modified by GUIDE v2.5 06-Mar-2020 20:03:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIsys_OpeningFcn, ...
                   'gui_OutputFcn',  @DIsys_OutputFcn, ...
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


% --- Executes just before DIsys is made visible.
function DIsys_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIsys (see VARARGIN)

% Choose default command line output for DIsys
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIsys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIsys_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
s=get(handles.popupmenu1, 'value');
if(s==1)
    set (handles.uipanel2,'Visible','on');
    set (handles.uipanel3,'Visible','off');
    set (handles.uipanel4,'Visible','off');
    set (handles.uipanel5,'Visible','off');
    set (handles.uipanel6,'Visible','off');
end
if(s==2)
    set (handles.uipanel2,'Visible','off');
    set (handles.uipanel3,'Visible','on');
    set (handles.uipanel4,'Visible','off');
    set (handles.uipanel5,'Visible','off');
    set (handles.uipanel6,'Visible','off');
end
if(s==3)
    set (handles.uipanel2,'Visible','off');
    set (handles.uipanel3,'Visible','off');
    set (handles.uipanel4,'Visible','on');
    set (handles.uipanel5,'Visible','off');
    set (handles.uipanel6,'Visible','off');
end
if(s==4)
    set (handles.uipanel2,'Visible','off');
    set (handles.uipanel3,'Visible','off');
    set (handles.uipanel4,'Visible','off');
    set (handles.uipanel5,'Visible','on');
    set (handles.uipanel6,'Visible','off');
end
if(s==5)
    set (handles.uipanel2,'Visible','off');
    set (handles.uipanel3,'Visible','off');
    set (handles.uipanel4,'Visible','off');
    set (handles.uipanel5,'Visible','off');
    set (handles.uipanel6,'Visible','on');
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX Flag_TXSZYT;
[filename, pathname] = uigetfile({'*jpg;*bmp;*tif;*mat'}, '读取图片文件'); %选择图片文件
if isequal(filename,0)   %判断是否选择
   msgbox('没有选择任何图片');
else
   pathfile=fullfile(pathname, filename);  %获得图片路径
   ff=endsWith(pathfile,'.mat');
   if(ff==1)
       tmpsz=load(pathfile);
       Flag_TXSZtmp=tmpsz.img;
       Flag_TXSZ=im2uint8(Flag_TXSZtmp);
%        ws=size(Flag_TXSZtmp);
%         for i=1:ws(1)
%             for j=1:ws(2)
%                 for k=1:ws(3)
%                     js1=Flag_TXSZtmp(i,j,k);
%                  Flag_TXSZ(i,j,k)=double(Flag_TXSZtmp(i,j,k))*double(255);
%                 end
%             end
%         end
   else
        Flag_TXSZ=imread(pathfile);     %将图片读入矩阵
        Flag_TXSZYT=Flag_TXSZ;
        imfinfo(pathfile);
   end
   imshow(Flag_TXSZ);
   Flag_IsOpenTX=1;
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
else
    ws=ndims(Flag_TXSZ);
    if(ws==2)
        msgbox('已经是灰度图像');
        return;
    end
    
    Flag_TXSZ=rgb2gray(Flag_TXSZ);
    imshow(Flag_TXSZ);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    
    szmin=min(min(Flag_TXSZ));
    szmax=max(max(Flag_TXSZ));
    ssmin=single(szmin)/255.0;
    ssmax=single(szmax)/255.0;
    J=imadjust(Flag_TXSZ,[ssmin;ssmax],[0;1]);  %调整灰度范围
    figure;
    subplot(121),imshow(uint8(Flag_TXSZ));
    subplot(122),imshow(uint8(J));
end



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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');


else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
    szmin=min(min(Flag_TXSZ));
    szmax=max(max(Flag_TXSZ));
    ssmin=single(szmin)/255.0;
    ssmax=single(szmax)/255.0;
    
    yourInputText = get(handles.edit1,'String');
    aa=str2num(yourInputText);
    J=imadjust(Flag_TXSZ,[ssmin;ssmax],[0;1],aa);  %调整灰度范围
    figure;
    subplot(121),imshow(uint8(Flag_TXSZ));
    subplot(122),imshow(uint8(J));
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');


else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

I=Flag_TXSZ;
J=histeq(I);  %直方图均衡化
figure,
subplot(221),imshow(uint8(I));
title('原图')
subplot(222),imshow(uint8(J));
title('均衡化后')
subplot(223),imhist(I,64);
title('原图像直方图');
subplot(224),imhist(J,64);
title('均衡化后的直方图');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');


else
%     close all;clear all;clc;
    return;
end
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end


img=Flag_TXSZ;
figure,imshow(img);
title('原始图像');


%构建模板
n=15;
model(1:n,1:n)=1;%a为n*n大小的模板，像素值为1
%对原图进行扩展，因为模板中心从图像的第一个像素开始，模板必然有点在图像外，无对应点，所以进行扩展，是的图像一一对应
imgTend=wextend('2D','sym',img,n);
tendTrans=double(imgTend);%变成double型便于后期的点乘计算
[row,col]=size(imgTend);%获取扩展后的图像的大小
tendTransTmp=tendTrans;
%model(a:b,c:d)表示A矩阵的第a到b行，第c到d列的所有元素
for i=n+1:row-n
	 for j=n+1:col-n %因为进行了扩展，所以原图像的第一个像素在扩展后的图像中对应的是（n+1，n+1）这个点
         modelResult=tendTrans(i:i+(n-1),j:j+(n-1)).*model(1:n,1:n);%在图像中取n*n大小，与模板对应点乘，生成点乘后的n*n大小的矩阵m
         modelEpual=histeq(uint8(modelResult));%对局部m进行直方图均衡化
        %k=histeq(m);%对块图进行直方图均衡，m为double型，所以其k就是全1，那么x2中对应的位置也就是全1，最后显示转化成uint8显示肯定为黑色。
         equalTmp=double(modelEpual);%k仍为n*n大小的矩阵
        tendTransTmp(i,j)=equalTmp(8,8);%将均衡后的中心点的像素值赋给原图对应点的元素
	end
end
%未被赋值的元素取原值
result=tendTransTmp(n+1:row-n,n+1:col-n);%均衡化后取原图像大小
result=uint8(result);
%d=uint8(x2);
figure,imshow(result);
title('均衡后的图像');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            %Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end



f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(2,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        resultImage(x,y)=sum(is(:))/numel(is); 
    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3算术均值');

resultImage= f(:,:);

for x=1+fssize2:1:w-fssize2
    for y=1+fssize2:1:h-fssize2
        is=f(x-fssize2:1:x+fssize2,y-fssize2:1:y+fssize2);
        resultImage(x,y)=sum(is(:))/numel(is); 

    end
end


subplot(2,2,3);
imshow(resultImage);
xlabel('5*5算术均值');

resultImage= f(:,:);

for x=1+fssize3:1:w-fssize3
    for y=1+fssize3:1:h-fssize3
        is=f(x-fssize3:1:x+fssize3,y-fssize3:1:y+fssize3);
        resultImage(x,y)=sum(is(:))/numel(is); 

    end
end


subplot(2,2,4);
imshow(resultImage);
xlabel('9*9算术均值');


f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(2,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3几何均值');

resultImage= f(:,:);


for x=1+fssize2:1:w-fssize2
    for y=1+fssize2:1:h-fssize2
        %遍历每个点的四周
        is=f(x-fssize2:1:x+fssize2,y-fssize2:1:y+fssize2);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end


subplot(2,2,3);
imshow(resultImage);
xlabel('5*5几何均值');

resultImage= f(:,:);


for x=1+fssize3:1:w-fssize3
    for y=1+fssize3:1:h-fssize3
        %遍历每个点的四周
        is=f(x-fssize3:1:x+fssize3,y-fssize3:1:y+fssize3);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end


subplot(2,2,4);
imshow(resultImage);
xlabel('9*9几何均值');

f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(2,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:)); 

    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3谐波均值');

resultImage= f(:,:);

for x=1+fssize2:1:w-fssize2
    for y=1+fssize2:1:h-fssize2
        %遍历每个点的四周
        is=f(x-fssize2:1:x+fssize2,y-fssize2:1:y+fssize2);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:));  
    end
end


subplot(2,2,3);
imshow(resultImage);
xlabel('5*5谐波均值');

resultImage= f(:,:);


for x=1+fssize3:1:w-fssize3
    for y=1+fssize3:1:h-fssize3
        %遍历每个点的四周
        is=f(x-fssize3:1:x+fssize3,y-fssize3:1:y+fssize3);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:));   
    end
end


subplot(2,2,4);
imshow(resultImage);
xlabel('9*9谐波均值');


 f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
Q1 = 1.5;
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(1,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        resultImage(x,y) = sum(is(:).^(Q1+1))/sum(is(:).^(Q1));
    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3逆谐波均值');

resultImage= f(:,:);



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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit2,'String');
mb=str2num(yourInputText1);

I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%========================1.1 算术均值滤波器===============================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
%存放处理后的图像
J_Arithmetic=zeros(MM,NN);
%逐点计算子窗口的算术平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的算术平均
        J_Arithmetic(i-len_m,j-len_n)=mean(mean(Block));
    end
end
figure;
imshow(J_Arithmetic);
title('算术均值滤波器')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit2,'String');
mb=str2num(yourInputText1);
I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%===================== 1.2 几何均值滤波器=================================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
J_Geometric=zeros(MM,NN);
%逐点计算子窗口的几何平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的几何均值
        J_Geometric(i-len_m,j-len_n)=(prod(prod(Block)))^(1/(m*n));
    end
end
figure;
imshow(J_Geometric);
title('几何均值滤波器');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit2,'String');
mb=str2num(yourInputText1);

I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%======================= 1.3 谐波均值滤波器===============================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
J_Harmonic=zeros(MM,NN);
%逐点计算子窗口的谐波平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的谐波平均
        s=sum(sum(1./Block));
        J_Harmonic(i-len_m,j-len_n)=m*n/s;
    end
end
figure;
imshow(J_Harmonic);
title('谐波均值滤波器');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit2,'String');
mb=str2num(yourInputText1);

I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%======================= 1.4 逆谐波均值滤波器=============================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
%滤波器阶数
Q=1.5;
J_Contraharmonic=zeros(MM,NN);
%逐点计算子窗口的谐波平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的谐波平均
        s1=sum(sum(Block.^(Q+1)));
        s2=sum(sum(Block.^Q));
        J_Contraharmonic(i-len_m,j-len_n)=s1/s2;
    end
end
figure;
imshow(J_Contraharmonic);
title('逆谐波均值滤波器');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;
end

img=Flag_TXSZ;
a_bmp = filter2(fspecial('average',3),img)/255; %进行3*3均值滤波

Igrad=img;
I1=img;
figure;
subplot(231),imshow(Flag_TXSZ);title('原图');
ws=size(I1);
for i=1:ws(1)-1
    for j=1:ws(2)-1
        x=I1(i,j+1)-I1(i,j);
        y=I1(i+1,j)-I1(i,j);
        grad=max(abs(x),abs(y));
        Igrad(i,j)=grad;%????
    end
end
Igrad=Flag_TXSZ-Igrad;
subplot(232),imshow(Igrad);title('梯度锐化');

p1 =fspecial('sobel');
add1 =imfilter(a_bmp,p1);
out1=add1+a_bmp;
subplot(233),imshow(out1);
title('sobel锐化结果');



p2 =fspecial('prewitt');
add2 =imfilter(a_bmp,p2);
out2=add2+a_bmp;
subplot(234),imshow(out2);
title('prewitt锐化结果');



p3 =fspecial('laplacian');
add3 =imfilter(a_bmp,p3);
out3=add3+a_bmp;
subplot(236),imshow(out3);
title('laplacian锐化结果');


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit4,'String');
mb=str2num(yourInputText1);

I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%======================= 1.4 逆谐波均值滤波器=============================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
%滤波器阶数
Q=1.5;
J_Contraharmonic=zeros(MM,NN);
%逐点计算子窗口的谐波平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的谐波平均
        s1=sum(sum(Block.^(Q+1)));
        s2=sum(sum(Block.^Q));
        J_Contraharmonic(i-len_m,j-len_n)=s1/s2;
    end
end
figure;
imshow(J_Contraharmonic);
title('逆谐波均值滤波器');


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;
end

img=Flag_TXSZ;
a_bmp = filter2(fspecial('average',3),img)/255; %进行3*3均值滤波

Igrad=img;
I1=img;
figure;
subplot(231),imshow(Flag_TXSZ);title('原图');
ws=size(I1);
for i=1:ws(1)-1
    for j=1:ws(2)-1
        x=I1(i,j+1)-I1(i,j);
        y=I1(i+1,j)-I1(i,j);
        grad=max(abs(x),abs(y));
        Igrad(i,j)=grad;%????
    end
end
Igrad=Flag_TXSZ-Igrad;
subplot(232),imshow(Igrad);title('梯度锐化');

p1 =fspecial('sobel');
add1 =imfilter(a_bmp,p1);
out1=add1+a_bmp;
subplot(233),imshow(out1);
title('sobel锐化结果');



p2 =fspecial('prewitt');
add2 =imfilter(a_bmp,p2);
out2=add2+a_bmp;
subplot(234),imshow(out2);
title('prewitt锐化结果');



p3 =fspecial('laplacian');
add3 =imfilter(a_bmp,p3);
out3=add3+a_bmp;
subplot(236),imshow(out3);
title('laplacian锐化结果');

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit2,'String');
n=str2num(yourInputText1);

b=medfilt2(Flag_TXSZ,[n,n]);


figure;
subplot(121),imshow(Flag_TXSZ);title('原图');

subplot(122);  
imshow(b); 
title('中值滤波');


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;


[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D <= 10)  H_0(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D <= 50)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D <= 150)  H_2(x+(P/2)+1,y+(Q/2)+1) = 1; end
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).理想低通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).理想低通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).理想低通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D > 10)  H_0(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D > 50)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D > 150)  H_2(x+(P/2)+1,y+(Q/2)+1) = 1; end
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).理想高通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).理想高通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).理想高通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        %n=1
        D_0 = 10;
        H_0(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);
        D_0 = 50;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);   
        D_0 = 150;
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);
        %H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).巴特沃斯低通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).巴特沃斯低通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).巴特沃斯低通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        %n=1
        D_0 = 10;
        H_0(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);
        D_0 = 50;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);   
        D_0 = 150;
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);
        %H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).巴特沃斯高通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).巴特沃斯高通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).巴特沃斯高通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=get(handles.popupmenu5, 'value');


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end
I=Flag_TXSZ;

I=im2double(I);

F=fft2(I);

F=fftshift(F);

F=abs(F);

T=log(F+1);

figure;

imshow(T,[]);

% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        %n=1
        D_0 = 10;
        H_0(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);
        D_0 = 50;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);   
        D_0 = 150;
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);
        %H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).巴特沃斯高通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).巴特沃斯高通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).巴特沃斯高通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        %n=1
        D_0 = 10;
        H_0(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);
        D_0 = 50;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);   
        D_0 = 150;
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);
        %H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).巴特沃斯低通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).巴特沃斯低通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).巴特沃斯低通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D > 10)  H_0(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D > 50)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D > 150)  H_2(x+(P/2)+1,y+(Q/2)+1) = 1; end
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).理想高通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).理想高通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).理想高通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

f = Flag_TXSZ;


[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_0 = zeros(P,Q);
H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D <= 10)  H_0(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D <= 50)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D <= 150)  H_2(x+(P/2)+1,y+(Q/2)+1) = 1; end
     end
end

G_0 = H_0 .* F;
G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_0 = real(ifft2(G_0));
g_0 = g_0(1:1:M,1:1:N);

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_0(x,y) = g_0(x,y) * (-1)^(x+y);
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure();
subplot(1,2,1);
imshow(f);
xlabel('1).原图');

subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('2).1图的傅里叶光谱');



figure();
subplot(1,2,1);
imshow(H_0,[0 1]);
xlabel('3).理想低通滤波(D=10)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_0(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_0)),[ ]);
xlabel('4).3得到的滤波结果');

subplot(1,2,2);
imshow(g_0,[0 1]);
xlabel('5).效果图(D=10)');



figure();
subplot(1,2,1);
imshow(H_1,[0 1]);
xlabel('6).理想低通滤波(D=50)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_1(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('7).6得到的滤波结果');

subplot(1,2,2);
imshow(g_1,[0 1]);
xlabel('8).效果图(D=50)');



figure();
subplot(1,2,1);
imshow(H_2,[0 1]);
xlabel('9).理想低通滤波(D=150)');

subplot(1,2,2);
h = mesh(1:20:P,1:20:Q,H_2(1:20:P,1:20:Q));
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');

figure();
subplot(1,2,1);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('10).9得到的滤波结果');

subplot(1,2,2);
imshow(g_2,[0 1]);
xlabel('11).效果图(D=150)');

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit4,'String');
n=str2num(yourInputText1);

b=medfilt2(Flag_TXSZ,[n,n]);


figure;
subplot(121),imshow(Flag_TXSZ);title('原图');

subplot(122);  
imshow(b); 
title('中值滤波');

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    
    szmin=min(min(Flag_TXSZ));
    szmax=max(max(Flag_TXSZ));
    ssmin=single(szmin)/255.0;
    ssmax=single(szmax)/255.0;
    J=imadjust(Flag_TXSZ,[ssmin;ssmax],[0;1]);  %调整灰度范围
    figure;
    subplot(121),imshow(uint8(Flag_TXSZ));
    title('原图');
    subplot(122),imshow(uint8(J));
    title('灰度变换');
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


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');


else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
    szmin=min(min(Flag_TXSZ));
    szmax=max(max(Flag_TXSZ));
    ssmin=single(szmin)/255.0;
    ssmax=single(szmax)/255.0;
    
    yourInputText = get(handles.edit3,'String');
    aa=str2num(yourInputText);
    J=imadjust(Flag_TXSZ,[ssmin;ssmax],[0;1],aa);  %调整灰度范围
    figure;
    subplot(121),imshow(uint8(Flag_TXSZ));
    title('原图');
    subplot(122),imshow(uint8(J));
    title(strcat('GAMMA 变换',yourInputText));
end

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');


else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

I=Flag_TXSZ;
J=histeq(I);  %直方图均衡化
figure,
subplot(221),imshow(uint8(I));
title('原图')
subplot(222),imshow(uint8(J));
title('均衡化后')
subplot(223),imhist(I,64);
title('原图像直方图');
subplot(224),imhist(J,64);
title('均衡化后的直方图');

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');


else
%     close all;clear all;clc;
    return;
end
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end


i


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


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit4,'String');
mb=str2num(yourInputText1);

I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%========================1.1 算术均值滤波器===============================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
%存放处理后的图像
J_Arithmetic=zeros(MM,NN);
%逐点计算子窗口的算术平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的算术平均
        J_Arithmetic(i-len_m,j-len_n)=mean(mean(Block));
    end
end
figure;
imshow(J_Arithmetic);
title('算术均值滤波器');

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit4,'String');
mb=str2num(yourInputText1);
I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%===================== 1.2 几何均值滤波器=================================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
J_Geometric=zeros(MM,NN);
%逐点计算子窗口的几何平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的几何均值
        J_Geometric(i-len_m,j-len_n)=(prod(prod(Block)))^(1/(m*n));
    end
end
figure;
imshow(J_Geometric);
title('几何均值滤波器');

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit4,'String');
mb=str2num(yourInputText1);

I=Flag_TXSZ;
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------1、均值滤波器-----------------------------------
%%======================= 1.3 谐波均值滤波器===============================
%定义子窗口的尺寸
m=mb;
n=mb;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
J_Harmonic=zeros(MM,NN);
%逐点计算子窗口的谐波平均
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %求子窗口的谐波平均
        s=sum(sum(1./Block));
        J_Harmonic(i-len_m,j-len_n)=m*n/s;
    end
end
figure;
imshow(J_Harmonic);
title('谐波均值滤波器');


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit5,'String');
aax=str2num(yourInputText1);
yourInputText2 = get(handles.edit6,'String');
aay=str2num(yourInputText2);

I = Flag_TXSZ;
%figure,subplot(1,2,1);imshow(I);title('原图像');
%T = rgb2gray(M);figure;imshow(I);
PSF = fspecial('motion',aax,aay);
J = imfilter(I,PSF,'conv','circular');
Flag_TXSZ=J;
 imshow(Flag_TXSZ);


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX Flag_TXSZYT;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
           % Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit5,'String');
aax=str2num(yourInputText1);
yourInputText2 = get(handles.edit6,'String');
aay=str2num(yourInputText2);

I = Flag_TXSZ;
%figure,subplot(1,2,1);imshow(I);title('原图像');
%T = rgb2gray(M);figure;imshow(I);
PSF = fspecial('motion',aax,aay);
frest=deconvwnr(I,PSF);

figure,
s=SNR(frest,Flag_TXSZYT);


ss=num2str(s);

subplot(121),imshow(uint8(Flag_TXSZ));
title('原图1');
subplot(122),imshow(uint8(frest));
title(strcat('逆滤波 SNR=',ss));


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S=input('输入信源概率：\n');

while(abs(sum(S)-1)>10e-10)

    fprintf('信源概率总和不为1\n') 

   S=input('重新输入信源概率：\n');

end

[ h,e ] = Huffman_code( S );
h
e
% 
% a=input('请输入编码符号(以矩阵输入，符号要加单引号)：\n');%%r=input('几元HUFFMAN？\n');
% 
% r=length(a);while(r<2)
% 
%     fprintf('至少2元\n')
% 
%     r=input('请输入编码符号(以矩阵输入，符号要加单引号)：\n');
% 
% end
% 
% if r>length(S)     %%当r大于信源个数时，只需要信源个数 元的编码就可以
% 
%     r=length(S);
% 
% end
% 
% l=length(S);
% 
% n=0;%%需要补充n个0概率信源
% 
% nn=0;%%存放求几元最低概率和的次数
% 
% if r>2
% 
%     if l > (n*(r-1)+r)
% 
%         n=n+1;
% 
%         nn=nn+1;
% 
%     end
% 
%        %n=n+1;
% 
%      nn=nn+2;%%加上第一次和最后一次
% 
%      n=((n+1)*(r-1)+r)-l;  %%求出补充概率为0的个数
% 
% else
% 
%     nn=l-r+1;
% 
%     n=0;
% 
% end
% 
% n;nn;
% 
% zero=zeros(1,n);
% 
% q=[zero,sort(S)];
% 
% m=zeros(nn+1,l+n);
% 
%   for ii=1:(nn+1)%%一共nn+1行
% 
%     [q,odr]=sort(q);%%odr存放顺序排列前 某信源的位置
% 
%     if ii>1         %%当加完一次再判断是否出现相等的
% 
%         same=find(q==qq);%%找到所有和相加后的项相等的项 的位置 
% 
%        cp=length(find(q==qq));  %%一共有几个
% 
%         for kk=1:cp-1       %%将相加后的项放在最后
% 
%             t=odr(same(kk));
% 
%             odr(same(kk))=odr(same(kk+1));
% 
%             odr(same(kk+1))=t;
% 
%         end
% 
%     end
% 
%   m(ii,:)=[odr(1:l-(ii-1)*(r-1)+n),zeros(1,(ii-1)*(r-1))];  %%将每次顺序排列 记录信源位置变化 关键是方便下面找出相加的项，该项一定在排列前的位置一定为１
% 
%     qq=0;%%存放几个最低概率的和
% 
%     for jj=1:min(r,l)      %%防止r元大于信源个数时出错。
% 
%         qq=q(jj)+qq;
% 
%     end
% 
%     one=ones(1,r-1);%补充矩阵1 
% 
%    q=[qq,q(r+1:l+n),one];
% 
% end
% 
%   for ii=0:(r-1)%%一共r元   
% 
%     c(nn+1,l*(ii+1))=a(ii+1);%%将最后一次的数进行编码
% 
% end
% 
% for i=1:nn-1%%从l-2行开始 到nn 一共nn-2次
% 
%     c(nn+1-i,1:l-1)=c(nn-i+2,l*(find(m(nn-i+1,:)==1))-(l-2):l*(find(m(nn-i+1,:)==1)));%%找到后一个相加后的项，即信源位置为1，
% 
%     for kk=0:(r-1)%%一共有r元
% 
%         c(nn+1-i,kk*l+1:(kk+1)*l-1)=c(nn+1-i,1:l-1);%%将找到的项放在另一行的相应位置
% 
%         c(nn+1-i,(kk+1)*l)=a(kk+1);%%再添加前一个相加项的编码
% 
%     end
% 
%     for j=1:(i*(r-1))%%第一次r-1,以后每次多加r-1
% 
%         c(nn+1-i,(j+r-1)*l+1:(j+r)*l)=c(nn-i+2,l*(find(m(nn-i+1,:)==j+1)-1)+1:l*(find(m(nn-i+1,:)==j+1)));%%将后一个非相加后的项 置于后面
% 
%     end
% 
% end
% 
% for i=1:length(c(2,:))/l
% 
%     h(i,1:l)=c(2,l*(find(m(1,:)==i)-1)+1:find(m(1,:)==i)*l);
% 
% end             %得到各个信源对应的把编码及码长
% 
% for i=1:length(c(2,:))/l-n
% 
%     hh(i,:)=h(i+n,:);%%取出概率大于0的信源编码
% 
%     ll(i)=length(find(abs(hh(i,1:l)))~=' ');
% 
% end
% 
% S=sort(S);%%由于长度是按照从长到短，故将信源概率从小到大排列
% 
%   xx=sum(S.*ll)    %得到并输出平均码长
% 
% hh               %输出信源对应的编码
% 
% ll              %输出信源对应的编码符号码长
% 
% hx=-S*log2(S')  %输出信源的熵
% 
% At=hx/(xx*log2(r))       %输出编码效率
% 
% det=sum(S.*((xx-ll).^2))%%输出方差?

% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;clear all;clc;
% 香农编码matlab实现
p = [0.5 0.19 0.19 0.07 0.05] %输入概率
n = length(p);
y = fliplr(sort(p));
D = zeros(n,4);
D(:,1) = y';
for i = 2:n
    D(1,2) = 0;
    D(i,2) = D(i-1,1)+D(i-1,2);
end
for i = 1:n
    D(i,3) = -log2(D(i,1));
    D(i,4) = ceil(D(i,3));
end
D
A = D(:,2)';
B = D(:,4)';
for j=1:n
    C=binary1(A(j),B(j))
end


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit7,'String');
s=str2num(yourInputText1);

F=Flag_TXSZ;

for i=1:ws(1)
    for j=1:ws(2)
        if(Flag_TXSZ(i,j)<s)
            F(i,j)=0;
        else
            F(i,j)=1;
        end
    end
end

figure;
    subplot(121),imshow(uint8(Flag_TXSZ));
    subplot(122),imshow(uint8(F),[0 1]);

% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

[T,SM]=graythresh(Flag_TXSZ);


F=Flag_TXSZ;

F=im2bw(Flag_TXSZ,T);

figure;
    subplot(121),imshow(uint8(Flag_TXSZ));
    subplot(122),imshow(uint8(F),[0 1]);


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

img=Flag_TXSZ;
Igrad=img;
I1=img;
figure;
subplot(231),imshow(Flag_TXSZ);title('原图');
ws=size(I1);
for i=1:ws(1)-1
    for j=1:ws(2)-1
        x=I1(i,j+1)-I1(i,j);
        y=I1(i+1,j)-I1(i,j);
        grad=max(abs(x),abs(y));
        Igrad(i,j)=grad;%????
    end
end
subplot(232),imshow(Igrad);title('梯度锐化');

a_bmp=Flag_TXSZ;
bw1 = edge(a_bmp,'sobel');
bw2 = edge(a_bmp,'roberts');
bw3 = edge(a_bmp,'prewitt');


subplot(233); imshow(bw1);title('sobel算子');
subplot(235);imshow(bw2);title('roberts算子');
subplot(234);imshow(bw2);title('prewitt算子');
I=Flag_TXSZ;
Ig2=double(I); %将f转换归一化的double类图像，然后进行滤波  
w=fspecial('laplacian',0);  
g1=imfilter(I,w,'replicate');  
subplot(236);  
imshow(g1); 
title('laplacian算子');


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

img = Flag_TXSZ;

img = im2bw(img);

B=bwboundaries(img);%库函数结果
 
[m,n]=size(img);
k=1;
flag=0;
for i=1:m %找到第一个不为0元素位置
    for j=1:n
        if img(i,j)>0
            stack(k,1)=i;
            stack(k,2)=j;
            starti=i;   %标记第一个点
            startj=j;
            dir=7;
            k=k+1;
            flag=1; %表示已经找到了第一个元素
            break;
        end
    end
    if flag==1
        break;
    end
end
 
while 1
    if mod(dir,2)==0
        dir=mod(dir+7,8); %偶数处理方式
    else
        dir=mod(dir+6,8); %奇数的处理方式
    end
    i=stack(k-1,1);
    j=stack(k-1,2);
    while 1
        flag=1;
        switch dir
            case 0
                if j+1<n+1&&img(i,j+1)>0%右方
                    stack(k,1)=i;
                    stack(k,2)=j+1;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                    dir=mod(dir+1,8);
                end
            case 1
                if i-1>0&&j+1<n+1&&img(i-1,j+1)>0%右上方
                    stack(k,1)=i-1;stack(k,2)=j+1;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                     dir=mod(dir+1,8);
                end
            case 2
                if i-1>0&&img(i-1,j)>0%上方
                    stack(k,1)=i-1;stack(k,2)=j;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                    dir=mod(dir+1,8);
                end
            case 3
                if i-1>0&&j-1>0&&img(i-1,j-1)>0%左上方
                    stack(k,1)=i-1;stack(k,2)=j-1;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                     dir=mod(dir+1,8);
                end
            case 4
                if j-1>0&&img(i,j-1)>0%左方
                    stack(k,1)=i;stack(k,2)=j-1;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                    dir=mod(dir+1,8);
                end
            case 5
                if i+1<m+1&&j-1>0&&img(i+1,j-1)>0%左下方
                    stack(k,1)=i+1;stack(k,2)=j-1;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                    dir=mod(dir+1,8);
                end
            case 6
                if i+1<m+1&&img(i+1,j)>0%下方
                    stack(k,1)=i+1;stack(k,2)=j;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                    dir=mod(dir+1,8);
                end
            case 7
                if i+1<m+1&&j+1<n+1&&img(i+1,j+1)>0%右下方
                    stack(k,1)=i+1;stack(k,2)=j+1;
                    k=k+1;
                    flag=0;%找到下一个元素位置
                else
                   dir=mod(dir+1,8);
                end
            otherwise
        end
        if flag==0%找到下一个点退出当前循环
            break;
        end
    end
    if  k-1>2&&stack(k-2,1)==starti&&stack(k-2,2)==startj&&stack(k-1,1)==stack(2,1)&&stack(k-1,2)==stack(2,2)%退出循环条件
        break;
    end
end
stack(k-1,:)=[];
 
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(img);
hold on;
for i=1:length(stack)
    hold on; plot(stack(:,2),stack(:,1),'r');
end


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit8,'String');
aax=str2num(yourInputText1);
yourInputText2 = get(handles.edit9,'String');
aay=str2num(yourInputText2);

i=Flag_TXSZ;
xform=[1 0 aax; 0 1 aay; 0 0 1]';
ic=maketform('affine',xform);%实现图像的平移
ic=imtransform(i,ic,'Xdata',[1 (size(i,2)+xform(3,1))],'Ydata',[1 (size(i,1)+xform(3,2))],'FillValues',255);
figure;
imshow(ic),axis on;


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;
end
% else
%     close all;clear all;clc;
%     ws=size(Flag_TXSZ);
%     if(ndims(Flag_TXSZ)==3)
%         if(ws(3)==3)
%             msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
%             Flag_TXSZ=rgb2gray(Flag_TXSZ);
%         end
%     end
% end


yourInputText1 = get(handles.edit10,'String');
aa1=str2num(yourInputText1);

 i=Flag_TXSZ; 
ib=maketform('affine',[aa1 0 0;0 aa1 0;0 0 1]');%创建缩放参数结构体
ib=imtransform(i,ib);%实现图像的缩放

    


    figure; 
%     subplot(121),imshow(uint8(Flag_TXSZ));
%     subplot(122),imshow(uint8(J));
    if aa1<1
    I=Flag_TXSZ;
    I1=ib;
    a1 = subplot(1, 2, 1); imshow(I),  
    xs = get(a1, 'xlim'); ys = get(a1, 'ylim');title('原图');
    a2 = subplot(1, 2, 2); imshow(I1),
    set(a2, 'xlim', xs, 'ylim', ys);title(strcat('缩放比例',yourInputText1));
    else
    I=Flag_TXSZ;
    I1=ib;
    a1 = subplot(1, 2, 2); imshow(I1),  
    xs = get(a1, 'xlim'); ys = get(a1, 'ylim');title(strcat('缩放比例',yourInputText1));
    a2 = subplot(1, 2, 1); imshow(I),
    set(a2, 'xlim', xs, 'ylim', ys);title('原图');
    end


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;
end

yourInputText1 = get(handles.edit11,'String');
aajz=str2num(yourInputText1);
yourInputText2 = get(handles.edit12,'String');
aafc=str2num(yourInputText2);
Flag_TXSZ=imnoise(Flag_TXSZ,'gaussian',aajz,aafc);
imshow(Flag_TXSZ);

% --- Executes on button press in pushbutton50.
function pushbutton50_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;
end


Flag_TXSZ=imnoise(Flag_TXSZ,'salt & pepper',0.02);
imshow(Flag_TXSZ);


% --- Executes on button press in pushbutton51.
function pushbutton51_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX Flag_TXSZYT;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
           % Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

yourInputText1 = get(handles.edit5,'String');
aax=str2num(yourInputText1);
yourInputText2 = get(handles.edit6,'String');
aay=str2num(yourInputText2);

yourInputText3 = get(handles.edit11,'String');
aax1=str2num(yourInputText3);
yourInputText4 = get(handles.edit12,'String');
aay2=str2num(yourInputText4);

f = Flag_TXSZ;
PSF = fspecial('motion',aax,aay);
ws=size(Flag_TXSZ)
r=ws(1);
r1=ws(2);
noise=20.*imnoise(zeros(r,r1),'gaussian',0,0.025);
% abs(fft2(noise))为 noise 的傅里叶频谱

Sn = abs(fft2(noise)).^2; % 得到噪声的功率谱
nA = sum(Sn(:))/numel(noise); % 得到 平均噪声功率
Sf = abs(fft2(f)).^2; % 得到未退化图像的功率谱
fA = sum(Sf(:))/numel(f); % 得到 平均图像功率
R = nA/fA; %得到参数维纳滤波器


frest=deconvwnr(f,PSF,0.05);

figure,
s=SNR(frest,Flag_TXSZYT);


ss=num2str(s);
subplot(121),imshow(uint8(Flag_TXSZ));
title('原图1');
subplot(122),imshow(uint8(frest));
title(strcat('维纳滤波 SNR=',ss));


% --- Executes on button press in pushbutton52.
function pushbutton52_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

J=Flag_TXSZ;
for i=2:(ws(1)-1)
    for j=2:(ws(2)-1)
        for m=1:3
            for n=1:3
                if(Flag_TXSZ(i+m-2,j+m-2)==Flag_TXSZ(i,j))
                    a(m,n)=2.0;
                else
                    a(m,n)=abs(1.0/((double(Flag_TXSZ(i+m-2,j+m-2))-double(Flag_TXSZ(i,j)))));
                end
            end
        end
        
        ss=double(0);
        for m=1:3
            for n=1:3
                if (m==2)&&(n==2)
                    
                else
                ss=ss+a(m,n);
                end
            end
        end
        
     
        for m=1:3
            for n=1:3
                xs(m,n)=double(a(m,n))/double(ss)*0.5;
            end
        end
        
        J(i,j)=0;
        for m=1:3
            for n=1:3
                if(m==2)&&(n==2)
                   J(i,j)=J(i,j)+0.5*Flag_TXSZ(i-2+m,j-2+n); 
                else
                    J(i,j)=J(i,j)+xs(m,n)*Flag_TXSZ(i-2+m,j-2+n);
                end
                
            end
        end
        
    end
end

     figure;
    subplot(121),imshow(uint8(Flag_TXSZ));title('原图');
    subplot(122),imshow(J);title('梯度倒数加权平均');
    


% --- Executes on button press in pushbutton53.
function pushbutton53_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

sym=0:255;

for i=1:256
    probs(i)=0;
end

for i=1:ws(1)
    for j=1:ws(2)
        probs(Flag_TXSZ(i,j)+1)=probs(Flag_TXSZ(i,j)+1)+1;
    end
end

for i=1:256
    prob(i)=probs(i)/(ws(1)*ws(2));
end

[dict,avglen]=huffmandict(sym,prob);

for i=1:ws(1)
    for j=1:ws(2)
        SIG(ws(2)*(i-1)+j)=Flag_TXSZ(i,j);
    end
end

enco=huffmanenco(SIG,dict);
save C:\Users\coco\Desktop\a.txt;
fid=fopen('C:\Users\coco\Desktop\a.txt','wt');%写入文件路径

wsd=size(dict);
for i=1:wsd(1)
    DICT(i,1)=dict{i,1};
    P=dict{i,2};
    PP=char(P+'0');
    PPP=str2num(PP);
    DICT(i,2)=PPP;
    
end

matrix=DICT; %input_matrix为待输出矩阵
[m,n]=size(matrix);
fprintf(fid,'平均编码长度%d\n',avglen);
fprintf(fid,'编码表\n');
for i=1:1:m
    for j=1:1:n
        if j==n
            fprintf(fid,'%d\n',matrix(i,j));
        else
            fprintf(fid,'%d\t',matrix(i,j));
        end
    end
end
fprintf(fid,'编码文件\n ');
matrix=enco;
[m,n]=size(matrix);
for i=1:1:m
    for j=1:1:n
        if j==n
            fprintf(fid,'%d\n',matrix(i,j));
        else
            fprintf(fid,'%d\t',matrix(i,j));
        end
    end
end
fclose(fid);


% --- Executes on button press in pushbutton55.
function pushbutton55_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton56.
function pushbutton56_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end

sym=0:255;

for i=1:256
    probs(i)=0;
end

for i=1:ws(1)
    for j=1:ws(2)
        probs(Flag_TXSZ(i,j)+1)=probs(Flag_TXSZ(i,j)+1)+1;
    end
end

for i=1:256
    prob(i)=probs(i)/(ws(1)*ws(2));
end

save C:\Users\coco\Desktop\a.txt;
fid=fopen('C:\Users\coco\Desktop\a.txt','wt');

p = prob; %输入概率
n = length(p);
y = fliplr(sort(p));
D = zeros(n,4);
D(:,1) = y';
for i = 2:n
    D(1,2) = 0;
    D(i,2) = D(i-1,1)+D(i-1,2);
end
for i = 1:n
    D(i,3) = -log2(D(i,1));
    D(i,4) = ceil(D(i,3));
end

matrix=D;
[m,n]=size(matrix);
for i=1:1:m
    for j=1:1:n
        if j==n
            fprintf(fid,'%d\n',matrix(i,j));
        else
            fprintf(fid,'%d\t',matrix(i,j));
        end
    end
end

A = D(:,2)';
B = D(:,4)';
for j=1:n
    C=binary1(A(j),B(j));
    matrix=C;
    [m,n]=size(matrix);
    for i=1:1:m
        for j=1:1:n
            if j==n
                fprintf(fid,'%d\n',matrix(i,j));
            else
                fprintf(fid,'%d\t',matrix(i,j));
            end
        end
    end
end
fclose(fid);


% --- Executes on button press in pushbutton57.
function pushbutton57_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_TXSZ Flag_IsOpenTX;
if Flag_IsOpenTX==0
    msgbox('请先选择图片');
    return;

else
%     close all;clear all;clc;
    ws=size(Flag_TXSZ);
    if(ndims(Flag_TXSZ)==3)
        if(ws(3)==3)
            msgbox('您输入的图片为真彩色图片，为进行该变换，系统自动转换为灰度图片');
            Flag_TXSZ=rgb2gray(Flag_TXSZ);
        end
    end
end



f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(2,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        resultImage(x,y)=sum(is(:))/numel(is); 
    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3算术均值');

resultImage= f(:,:);

for x=1+fssize2:1:w-fssize2
    for y=1+fssize2:1:h-fssize2
        is=f(x-fssize2:1:x+fssize2,y-fssize2:1:y+fssize2);
        resultImage(x,y)=sum(is(:))/numel(is); 

    end
end


subplot(2,2,3);
imshow(resultImage);
xlabel('5*5算术均值');

resultImage= f(:,:);

for x=1+fssize3:1:w-fssize3
    for y=1+fssize3:1:h-fssize3
        is=f(x-fssize3:1:x+fssize3,y-fssize3:1:y+fssize3);
        resultImage(x,y)=sum(is(:))/numel(is); 

    end
end


subplot(2,2,4);
imshow(resultImage);
xlabel('9*9算术均值');


f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(2,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3几何均值');

resultImage= f(:,:);


for x=1+fssize2:1:w-fssize2
    for y=1+fssize2:1:h-fssize2
        %遍历每个点的四周
        is=f(x-fssize2:1:x+fssize2,y-fssize2:1:y+fssize2);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end


subplot(2,2,3);
imshow(resultImage);
xlabel('5*5几何均值');

resultImage= f(:,:);


for x=1+fssize3:1:w-fssize3
    for y=1+fssize3:1:h-fssize3
        %遍历每个点的四周
        is=f(x-fssize3:1:x+fssize3,y-fssize3:1:y+fssize3);
        resultImage(x,y)=prod(prod(is(:)))^(1/numel(is)); 
    end
end


subplot(2,2,4);
imshow(resultImage);
xlabel('9*9几何均值');

f=Flag_TXSZ;

[w,h]=size(f);
image= f(:,:);
fsize1=3;
fsize2=5;
fsize3=9;

fssize1=(fsize1-1)/2;
fssize2=(fsize2-1)/2;
fssize3=(fsize3-1)/2;

figure();
subplot(2,2,1);
imshow(image);
xlabel('原图像');

resultImage = image;

for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:)); 

    end
end


subplot(2,2,2);
imshow(resultImage);
xlabel('3*3谐波均值');

resultImage= f(:,:);

for x=1+fssize2:1:w-fssize2
    for y=1+fssize2:1:h-fssize2
        %遍历每个点的四周
        is=f(x-fssize2:1:x+fssize2,y-fssize2:1:y+fssize2);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:));  
    end
end


subplot(2,2,3);
imshow(resultImage);
xlabel('5*5谐波均值');

resultImage= f(:,:);


for x=1+fssize3:1:w-fssize3
    for y=1+fssize3:1:h-fssize3
        %遍历每个点的四周
        is=f(x-fssize3:1:x+fssize3,y-fssize3:1:y+fssize3);
        is=1./is;
        resultImage(x,y)=numel(is)/sum(is(:));   
    end
end


subplot(2,2,4);
imshow(resultImage);
xlabel('9*9谐波均值');
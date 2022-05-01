function varargout = RunFCFS(varargin)

% Last Modified by GUIDE v2.5 09-Apr-2022 10:25:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RunFCFS_OpeningFcn, ...
                   'gui_OutputFcn',  @RunFCFS_OutputFcn, ...
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


% --- Executes just before RunFCFS is made visible.
function RunFCFS_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for RunFCFS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RunFCFS wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global dem;
dem=0;
global artime;
artime=[];
global btime;
btime=[];
global temp;
temp=0;
global p;
global delay;
delay=0;
p.MyData=[];
global ctime;
ctime=[];
global tatime;
tatime=[];
global wtime;
wtime=[];
global rtime;
rtime=[];
global atatime;
atatime=0;
global awtime;
awtime=0;
global kq1;
kq1=0;
global kq2;
kq2=0;
global tbtime;
tbtime=0;
global flag;
flag=0;
global chon;
global pinput;
pinput=[];

% --- Outputs from this function are returned to the command line.
function varargout = RunFCFS_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in addButton.
function addButton_Callback(hObject, eventdata, handles)
global dem;
global artime;
global btime;
global pinput;

dem=dem+1;

pinput2 = get(handles.inputP,'string');
pinput2 = str2num(pinput2);
pinput(dem) = pinput2;
art = get(handles.inputArtime,'string');
art = str2num(art);
artime(dem)=art;
bt = get(handles.inputBtime,'string');
bt = str2num(bt);
btime(dem)=bt;

if pinput(dem)>=0
    msgbox(['Add progress data ' num2str(dem) ' successful!'])
end

% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
close;
run RunFCFS;

function inputArtime_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of inputArtime as text
%        str2double(get(hObject,'String')) returns contents of inputArtime as a double

function inputArtime_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function inputBtime_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of inputBtime as text
%        str2double(get(hObject,'String')) returns contents of inputBtime as a double


% --- Executes during object creation, after setting all properties.
function inputBtime_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in backButton.
function backButton_Callback(hObject, eventdata, handles)
close;
run StartMenu;

% --- Executes on button press in showButton.
function showButton_Callback(hObject, eventdata, handles)
global tatime;
global wtime;
global chon;

chon = get(handles.luachon,'value');
switch chon
    case 1
        plot(tatime);
    case 2
        plot(wtime);
end

function inputP_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of inputP as text
%        str2double(get(hObject,'String')) returns contents of inputP as a double


% --- Executes during object creation, after setting all properties.
function inputP_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in luachon.
function luachon_Callback(hObject, eventdata, handles)
% Hints: contents = cellstr(get(hObject,'String')) returns luachon contents as cell array
%        contents{get(hObject,'Value')} returns selected item from luachon


% --- Executes during object creation, after setting all properties.
function luachon_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
global dem;
global artime
global btime;
global ctime;
global tatime;
global wtime;
global rtime;
global tbtime;
global flag;
global pinput;
global delay;
global atatime;
global awtime;
global kq1;
global kq2;
global p;
global temp;

for i=1:1:dem
    for j=(i+1):1:dem
        if artime(i)>artime(j)
            temp=artime(i);
            artime(i)=artime(j);
            artime(j)=temp;
            
            temp=pinput(i);
            pinput(i)=pinput(j);
            pinput(j)=temp;
            temp=btime(i);
            btime(i)=btime(j);
            btime(j)=temp;
        end
    end
end

for i=1:1:dem
    for j=(i+1):1:dem
        if artime(i)==artime(j) && pinput(i)>pinput(j)
            temp=artime(i);
            artime(i)=artime(j);
            artime(j)=temp;
            
            temp=pinput(i);
            pinput(i)=pinput(j);
            pinput(j)=temp;
            temp=btime(i);
            btime(i)=btime(j);
            btime(j)=temp;
        end
    end
end

for i=1:1:dem
    if i>=2
        tbtime=tbtime+btime(i-1);
        if artime(i)>tbtime
            delay=artime(i)-tbtime;
            flag=1;
        end
    end

    if i==1
        ctime(i)=artime(i) + btime(i);
    elseif i>=2 && flag==1
        ctime(i)=ctime(i-1)+btime(i)+delay;
    else
        ctime(i)=ctime(i-1)+btime(i);
    end
    tatime(i)=ctime(i)-artime(i);
    wtime(i)=tatime(i)-btime(i);
    if i==1
        rtime(i)=artime(i);
    elseif i>1 && flag==1
        rtime(i)=(ctime(i)-(ctime(i)-ctime(i-1)-delay))-artime(i);
        flag=0;
    elseif i>1 && flag==0
        rtime(i)=(ctime(i)-(ctime(i)-ctime(i-1)))-artime(i);
    end
    p.MyData = [p.MyData; [{pinput(i)} {artime(i)} {btime(i)} {ctime(i)} {tatime(i)} {wtime(i)} {rtime(i)}]];
    set(handles.resulttable,'Data',p.MyData);
    atatime=tatime(i)+atatime;
    awtime=wtime(i)+awtime;
end

kq1=atatime/dem;
kq2=awtime/dem;
set(handles.oatatime,'String',kq1);
set(handles.oawtime,'String',kq2);

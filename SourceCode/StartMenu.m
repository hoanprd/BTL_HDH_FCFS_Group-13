function varargout = StartMenu(varargin)
% STARTMENU MATLAB code for StartMenu.fig
%      STARTMENU, by itself, creates a new STARTMENU or raises the existing
%      singleton*.
%
%      H = STARTMENU returns the handle to a new STARTMENU or the handle to
%      the existing singleton*.
%
%      STARTMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STARTMENU.M with the given input arguments.
%
%      STARTMENU('Property','Value',...) creates a new STARTMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StartMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StartMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StartMenu

% Last Modified by GUIDE v2.5 19-Mar-2022 11:20:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StartMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @StartMenu_OutputFcn, ...
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


% --- Executes just before StartMenu is made visible.
function StartMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StartMenu (see VARARGIN)

% Choose default command line output for StartMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StartMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StartMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
run RunFCFS;

% --- Executes on button press in exitButton.
function exitButton_Callback(hObject, eventdata, handles)
% hObject    handle to exitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes during object creation, after setting all properties.
function BG_CreateFcn(hObject, eventdata, handles)
imshow('BG.jpg');
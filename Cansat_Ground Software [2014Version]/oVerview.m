function varargout = oVerview(varargin)
% OVERVIEW MATLAB code for oVerview.fig
%      OVERVIEW, by itself, creates a new OVERVIEW or raises the existing
%      singleton*.
%
%      H = OVERVIEW returns the handle to a new OVERVIEW or the handle to
%      the existing singleton*.
%
%      OVERVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OVERVIEW.M with the given input arguments.
%
%      OVERVIEW('Property','Value',...) creates a new OVERVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before oVerview_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to oVerview_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help oVerview

% Last Modified by GUIDE v2.5 10-Jun-2015 09:56:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @oVerview_OpeningFcn, ...
                   'gui_OutputFcn',  @oVerview_OutputFcn, ...
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


% --- Executes just before oVerview is made visible.
function oVerview_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to oVerview (see VARARGIN)

% Choose default command line output for oVerview
handles.output = hObject;
imshow ('Team_Tomahawk_logo.JPG');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes oVerview wait for user response (see UIRESUME)
% uiwait(handles.figureoverview);

chase = timer('TimerFcn',{@Update,  handles}, 'ExecutionMode','fixedRate',...
               'Period', 1);
           start (chase);




% --- Outputs from this function are returned to the command line.
function varargout = oVerview_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Update(hObject, eventdata, handles)




% --- Executes during object creation, after setting all properties.
function figureoverview_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figureoverview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
    
   display (eventdata.Key);
    

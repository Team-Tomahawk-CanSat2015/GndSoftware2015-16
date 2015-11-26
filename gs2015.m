function varargout = gs2015(varargin)
% GS2015 MATLAB code for gs2015.fig
%      GS2015, by itself, creates a new GS2015 or raises the existing
%      singleton*.
%
%      H = GS2015 returns the handle to a new GS2015 or the handle to
%      the existing singleton*.
%
%      GS2015('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GS2015.M with the given input arguments.
%
%      GS2015('Property','Value',...) creates a new GS2015 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gs2015_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gs2015_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gs2015

% Last Modified by GUIDE v2.5 25-Nov-2015 20:02:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gs2015_OpeningFcn, ...
                   'gui_OutputFcn',  @gs2015_OutputFcn, ...
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


% --- Executes just before gs2015 is made visible.
function gs2015_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gs2015 (see VARARGIN)

% Choose default command line output for gs2015
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gs2015 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Team Tomahawk Logo addition
axes (handles.logo);
imshow ('Team_Tomahawk_logo.JPG');
%CAnada Flag Logo addition
axes (handles.CanadaFlag);
imshow ('CanadaFlag.png');
%populate graph
axes (handles.Graph1);
% Table_data = get(handles.uitable1, 'Data');

guidata(hObject, handles);
%Setup Comport selection popup
ScanCOMPorts(handles);


% --- Outputs from this function are returned to the command line.
function varargout = gs2015_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connectbotton.
function connectbotton_Callback(hObject, eventdata, handles)
% hObject    handle to connectbotton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%display (get (handles.comporttext, 'String'));
global ard;
selectedPort = get(handles.ComportPopup,'Value');
Portlist = get(handles.ComportPopup,'String');
comport = Portlist{selectedPort};
ard = ConnectButtonfunc(comport, handles);


% --- Executes on button press in TakePictureButton.
function TakePictureButton_Callback(hObject, eventdata, handles)
% hObject    handle to TakePictureButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in NichromeBurnButton.
function NichromeBurnButton_Callback(hObject, eventdata, handles)
% hObject    handle to NichromeBurnButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function comporttext_Callback(hObject, eventdata, handles)
% hObject    handle to comporttext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comporttext as text
%        str2double(get(hObject,'String')) returns contents of comporttext as a double


% --- Executes during object creation, after setting all properties.
function comporttext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comporttext (see GCBO)
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


% --- Executes on button press in Set_Servo.
function Set_Servo_Callback(hObject, eventdata, handles)
% hObject    handle to Set_Servo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in graph2xaxis.
function graph2xaxis_Callback(hObject, eventdata, handles)
% hObject    handle to graph2xaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph2xaxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph2xaxis


% --- Executes during object creation, after setting all properties.
function graph2xaxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph2xaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graph2yaxis.
function graph2yaxis_Callback(hObject, eventdata, handles)
% hObject    handle to graph2yaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph2yaxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph2yaxis


% --- Executes during object creation, after setting all properties.
function graph2yaxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph2yaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in StopTimer.
function StopTimer_Callback(hObject, eventdata, handles)
% hObject    handle to StopTimer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
StopTimerButtonfunc();

% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open ('Help.wiki.htm');


% --- Executes on selection change in ComportPopup.
function ComportPopup_Callback(hObject, eventdata, handles)
% hObject    handle to ComportPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ComportPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ComportPopup
ScanCOMPorts(handles);


% --- Executes during object creation, after setting all properties.
function ComportPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ComportPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on ComportPopup and none of its controls.
function ComportPopup_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ComportPopup (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
ScanCOMPorts(handles);


% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ScanCOMPorts(handles);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
StopTimerButtonfunc();



function Note1_Callback(hObject, eventdata, handles)
% hObject    handle to Note1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Note1 as text
%        str2double(get(hObject,'String')) returns contents of Note1 as a double


% --- Executes during object creation, after setting all properties.
function Note1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Note1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Graph1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Graph1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate Graph1
handles.Graph1=hObject; % tag for this axis, which I call axesX in this example
guidata(hObject, handles); % update the handles structure for the gui

% --- Executes during object creation, after setting all properties.
function Graph2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Graph2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate Graph2
handles.Graph2=hObject; % tag for this axis, which I call axesX in this example
guidata(hObject, handles); % update the handles structure for the gui


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on selection change in graph1xaxis.
function graph1xaxis_Callback(hObject, eventdata, handles)
% hObject    handle to graph1xaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph1xaxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph1xaxis
% axes(handles.Graph1);
% str1 = get(hObject,'String');
% val1 = get(hObject,'Value');
% switch str1{val1};
%     case 'Time'
%         handles.graph1xaxis = handles.time;
%     case 'Pressure Alt.'
%         handles.graph1xaxis = handles.PresAlt;
%     case 'Pitot Speed'
%         handles.graph1xaxis = handles.Pitot_speed;
%     case 'Temperature'
%         handles.graph1xaxis = handles.temp;
%     case 'Voltage' 
%         handles.graph1xaxis = handles.voltage;
%     case 'GPS Latitude'
%         handles.graph1xaxis = handles.GPS_lat;
%     case 'GPS Longitude'
%         handles.graph1xaxis = handles.GPS_long;
%     case 'GPS Altitude'
%         handles.graph1xaxis = handles.GPS_alt;
%     case 'GPS Satnum'
%         handles.graph1xaxis = handles.GPS_satnum;
%     case 'GPS Speed'
%         handles.graph1xaxis = handles.GPS_speed;
% end
% guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function graph1xaxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph1xaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graph1yaxis.
function graph1yaxis_Callback(hObject, eventdata, handles)
% hObject    handle to graph1yaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph1yaxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph1yaxis
% axes(handles.Graph1);
% str1 = get(hObject,'String');
% val1 = get(hObject,'Value');
% switch str1{val1};
%     case 'Time'
%         handles.graph1yaxis = handles.time;
%     case 'Pressure Alt.'
%         handles.graph1yaxis = handles.PresAlt;
%     case 'Pitot Speed'
%         handles.graph1yaxis = handles.Pitot_speed;
%     case 'Temperature'
%         handles.graph1yaxis = handles.temp;
%     case 'Voltage' 
%         handles.graph1yaxis = handles.voltage;
%     case 'GPS Latitude'
%         handles.graph1yaxis = handles.GPS_lat;
%     case 'GPS Longitude'
%         handles.graph1yaxis = handles.GPS_long;
%     case 'GPS Altitude'
%         handles.graph1yaxis = handles.GPS_alt;
%     case 'GPS Satnum'
%         handles.graph1yaxis = handles.GPS_satnum;
%     case 'GPS Speed'
%         handles.graph1yaxis = handles.GPS_speed;
% end
% guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function graph1yaxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph1yaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

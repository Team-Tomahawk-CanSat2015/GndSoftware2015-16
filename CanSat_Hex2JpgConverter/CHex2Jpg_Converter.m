function varargout = CHex2Jpg_Converter(varargin)
% CHEX2JPG_CONVERTER MATLAB code for CHex2Jpg_Converter.fig
%      CHEX2JPG_CONVERTER, by itself, creates a new CHEX2JPG_CONVERTER or raises the existing
%      singleton*.
%
%      H = CHEX2JPG_CONVERTER returns the handle to a new CHEX2JPG_CONVERTER or the handle to
%      the existing singleton*.
%
%      CHEX2JPG_CONVERTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHEX2JPG_CONVERTER.M with the given input arguments.
%
%      CHEX2JPG_CONVERTER('Property','Value',...) creates a new CHEX2JPG_CONVERTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CHex2Jpg_Converter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CHex2Jpg_Converter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CHex2Jpg_Converter

% Last Modified by GUIDE v2.5 11-Jun-2016 10:24:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CHex2Jpg_Converter_OpeningFcn, ...
                   'gui_OutputFcn',  @CHex2Jpg_Converter_OutputFcn, ...
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


% --- Executes just before CHex2Jpg_Converter is made visible.
function CHex2Jpg_Converter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CHex2Jpg_Converter (see VARARGIN)

% Choose default command line output for CHex2Jpg_Converter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes (handles.axes3);
imshow ('Team_Tomahawk_logo.JPG');
axes (handles.Image);
imshow ('Team_Tomahawk_logo.JPG');

% UIWAIT makes CHex2Jpg_Converter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this functionare returned to the command line.
function varargout = CHex2Jpg_Converter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} =handles.output;


% --- Executes on button press in Convert_Button.
function Convert_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Convert_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gocolor = get (handles.Convert_Button, 'BackgroundColor');
set (handles.Convert_Button, 'String', 'Busy...');
set (handles.Convert_Button, 'BackgroundColor', 'red');
pause (0.5);

Hex2Jpg_Convert(handles, get (handles.HexData, 'String'), get(handles.ImagefileName, 'String'));
axes (handles.Image);
show = strcat(get(handles.ImagefileName, 'String'), '.JPG');
imshow (show);


 set (handles.Convert_Button, 'BackgroundColor', gocolor);
 set (handles.Convert_Button, 'String', 'Convert');

function HexData_Callback(hObject, eventdata, handles)
% hObject    handle to HexData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HexData as text
%        str2double(get(hObject,'String')) returns contents of HexData as a double


% --- Executes during object creation, after setting all properties.
function HexData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HexData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ImagefileName_Callback(hObject, eventdata, handles)
% hObject    handle to ImagefileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImagefileName as text
%        str2double(get(hObject,'String')) returns contents of ImagefileName as a double


% --- Executes during object creation, after setting all properties.
function ImagefileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagefileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function csv_files_Callback(hObject, eventdata, handles)
% hObject    handle to csv_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of csv_files as text
%        str2double(get(hObject,'String')) returns contents of csv_files as a double

% --- Executes during object creation, after setting all properties.
function csv_files_CreateFcn(hObject, eventdata, handles)
% hObject    handle to csv_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Fill_hex_field.
function Fill_hex_field_Callback(hObject, eventdata, handles)
% hObject    handle to Fill_hex_field (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
csv_string = get(handles.csv_files, 'String');
csv_value = get(handles.csv_files, 'Value');
csv_name = csv_string{csv_value};
convert_me = sprintf(Suicide(1, csv_name, 15, handles));
id = fopen('hex_data.txt')
line = fscanf(id, '%s');
set(handles.HexData, 'String', line);
fclose('all');





function Hex_Data_Callback(hObject, eventdata, handles)
% hObject    handle to Hex_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hex_Data as text
%        str2double(get(hObject,'String')) returns contents of Hex_Data as a double


% --- Executes during object creation, after setting all properties.
function Hex_Data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hex_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to HexData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HexData as text
%        str2double(get(hObject,'String')) returns contents of HexData as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HexData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on key press with focus on csv_files and none of its controls.
function csv_files_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to csv_files (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over csv_files.
Scan_csv_Files(handles);
% hObject    handle to csv_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Scan_csv_Files(handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over csv_files.
function csv_files_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to csv_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

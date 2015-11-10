function [] = Update_GUIgraph(handles, table_filename)

handles.Table_data = get(handles.uitable1, 'Data');

handles.time = handles.Table_data(1,:);
handles.PresAlt = handles.Table_data(2,:);
handles.Pitot_speed = handles.Table_data(3,:);
handles.temp = handles.Table_data(4, :);
handles.voltage = handles.Table_data(5,:);
handles.GPS_lat =handles.Table_data(6,:);
handles.GPS_long = handles.Table_data(7,:);
handles.GPS_alt = handles.Table_data(8,:);
handles.GPS_satnum = handles.Table_data(9,:);
handles.GPS_speed = handles.Table_data(10,:);

guidata(handles.graph1xaxis, handles);
guidata(handles.graph1yaxis, handles);

function [] = Update_GUIgraph(handles, table_filename)

% first, initialize this new handles in the Opening Fcn
%collect data from uitable
handles.Table_data = get(handles.uitable1,'Data');

%next, get the number of the selection from the popup menus
 n = get(handles.graph1xaxis, 'Value');
 k = get(handles.graph1yaxis, 'Value');
 j = get(handles.graph2yaxis, 'Value');
 p = get(handles.graph2xaxis, 'Value');

%assign a new handles to a selected row of data from table based on the
%selections above
handles.x1 = handles.Table_data(n,:);
handles.y1 = handles.Table_data(k,:);
handles.x2 = handles.Table_data(p,:);
handles.y2 = handles.Table_data(j,:);

%plot in figure labelled Graph 1 and Graph 2
plot(handles.x1, handles.y1,'Parent', handles.Graph1);
plot(handles.x2, handles.y2,'Parent', handles.Graph2);
end 

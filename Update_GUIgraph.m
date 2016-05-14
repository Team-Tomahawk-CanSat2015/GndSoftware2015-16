function [] = Update_GUIgraph(handles, table_filename)

% first, initialize this new handles in the Opening Fcn
%collect data from uitable
handles.Table_data = get(handles.uitable1,'Data');

%next, get the number of the selection from the popup menus
 n = get(handles.graph1xaxis, 'Value');
 k = get(handles.graph1yaxis, 'Value');
%  p = get(handles.graph2xaxis, 'Value');
%  j = get(handles.graph2yaxis, 'Value');

 switch n
     case '1'
         set(handles.Graph1, 'XLabel', 'Time (sec.)');
     case '2'
         set(handles.Graph1, 'XLabel', 'Pkt. Count (Packet#)');
     case '3'
         set(handles.Graph1, 'XLabel', 'Altitude (m)');
     case '4'
         set(handles.Graph1, 'XLabel', 'Pressure (Pa)');
     case '5' 
         set(handles.Graph1, 'XLabel', 'Pitot (m/s)');
     case '6' 
         set(handles.Graph1, 'XLabel', 'Temp. (C)');
     case '7'
         set(handles.Graph1, 'XLabel', 'Voltage (V)');
     case '8' 
         set(handles.Graph1, 'XLabel', 'Latitude');
     case '9'
         set(handles.Graph1, 'XLabel', 'Longitude');
     case '10'
         set(handles.Graph1, 'XLabel', 'GPS Altitude (m)');
     case '11'
         set(handles.Graph1, 'XLabel', 'SatNum (#)');
     case '12'
         set(handles.Graph1, 'XLabel', 'GPS Speed (m/s)');
 end 
 
  switch k
     case '1'
         set(handles.Graph1, 'YLabel', 'Time (sec.)');
     case '2'
         set(handles.Graph1, 'YLabel', 'Pkt. Count (Packet#)');
     case '3'
         set(handles.Graph1, 'YLabel', 'Altitude (m)');
     case '4'
         set(handles.Graph1, 'YLabel', 'Pressure (Pa)');
     case '5' 
         set(handles.Graph1, 'YLabel', 'Pitot (m/s)');
     case '6' 
         set(handles.Graph1, 'YLabel', 'Temp. (C)');
     case '7'
         set(handles.Graph1, 'YLabel', 'Voltage (V)');
     case '8' 
         set(handles.Graph1, 'YLabel', 'Latitude');
     case '9'
         set(handles.Graph1, 'YLabel', 'Longitude');
     case '10'
         set(handles.Graph1, 'YLabel', 'GPS Altitude (m)');
     case '11'
         set(handles.Graph1, 'YLabel', 'SatNum (#)');
     case '12'
         set(handles.Graph1, 'YLabel', 'GPS Speed (m/s)');
 end 
 
%assign a new handles to a selected row of data from table based on the
%selections above
handles.x1 = handles.Table_data(n,:);
handles.y1 = handles.Table_data(k,:);
% handles.x2 = handles.Table_data(p,:);
% handles.y2 = handles.Table_data(j,:);

%plot in figure labelled Graph 1 and Graph 2

set(handles.Graph1, 'grid', 'on');
% set(handles.Graph2, 'grid', 'on');
plot(handles.x1, handles.y1,'Parent', handles.Graph1);
% plot(handles.x2, handles.y2,'Parent', handles.Graph2);
%regression
% try
% polyfit(handles.x1, handles.y1, 2);
% quad_regr = polyfit(1,3).*handles.x1 + polyfit(1,2).*handles.x1 + polyfit(1,1).*handles.x1 ;
% plot(handles.x1, quad_regr, 'Parent', handles.Graph1);
% 
% polyfit(handles.x2, handles.y2, 2);
% quad_regr = polyfit(1,3).*handles.x2 + polyfit(1,2).*handles.x2 + polyfit(1,1).*handles.x2 ;
% plot(handles.x2, quad_regr, 'Parent', handles.Graph2);
% catch
% end

end

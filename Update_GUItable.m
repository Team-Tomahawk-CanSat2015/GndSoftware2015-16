function [] = Update_GUItable(handles, table_filename)

%takes the name of the most recent CSV file and displays it in the table
%with updated values
extension = '.csv';
table_filename = strcat(table_filename, extension);
data = csvread(table_filename);
data = transpose(data(:, 2:11));  
Rows = ({'Time','Press. Alt', 'Pitot Spd', 'Temp.', 'Voltage', 'GPS Lat.', 'GPS Long.', 'GPS Alt.',...
            'GPS Satnum.', 'GPS Spd.'});

%update the handles in the table and format ****NEED TO WORK MORE ON THE
%FORMAT TO MAKE IT LOOK BETTER****
set(handles.uitable1, 'Data', data, 'RowName', Rows, 'ColumnName', 'numbered');

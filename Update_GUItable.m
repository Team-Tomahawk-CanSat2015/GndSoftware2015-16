function [] = Update_GUItable(handles, table_filename, csvfile)

%takes the name of the most recent CSV file and displays it in the table
%with updated values
extension = '.csv';
global i;
i=i+1;
display(i);
table_filename = strcat(table_filename, extension);
% data = csvread(table_filename,0,0,[0 0 i 17]);
% data = dlmread(table_filename, ',', [0 0 i 12]);
% data = textscan(csvfile, '%s');
% handles.globalmatrix(i,:) = str2double(data{1}{});
% display(data);
% data = transpose(data(:, 2:11));  
data = Suicide(csvfile);

Rows = ({'Time','Press. Alt', 'Pitot Spd', 'Temp.', 'Voltage', 'GPS Lat.', 'GPS Long.', 'GPS Alt.',...
            'GPS Satnum.', 'GPS Spd.'});

%update the handles in the table and format ****NEED TO WORK MORE ON THE
%FORMAT TO MAKE IT LOOK BETTER****
set(handles.uitable1, 'Data', data, 'RowName', Rows, 'ColumnName', 'numbered');

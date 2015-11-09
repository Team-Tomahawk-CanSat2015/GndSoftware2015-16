function [] = Update_GUIgraph(handles, table_filename)

%takes the name of the most recent CSV file and displays it in the table
%with updated values
extension = '.csv';
table_filename = strcat(table_filename, extension);
data = csvread(table_filename);


axes(handles.Graph1);
plot(data(:,2), data(:,4));

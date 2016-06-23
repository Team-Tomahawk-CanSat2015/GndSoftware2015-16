function [] = Scan_csv_Files(handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

csv_filess = struct2cell(dir('*.csv'));
[rows columns] = size(csv_filess);
if columns>0
csv_filess = csv_filess(1, 1:columns);
set(handles.csv_files, 'String', csv_filess);
else
    set(handles.csv_files, 'String', 'No files found');
end
% set(handles.csv_list, 'String', csv_files.name);
% set (handles.csv_list, 'Value', numel (csv_files));

% else
% set (handles.ComportPopup, 'String', 'PORTS EMPTY');
% set (handles.ComportPopup, 'Value', 1);
% end 

end


function [ard] = ConnectButtonfunc(comport, handles)
%   This file is called when the connect button is clicked on main GUI
%   This file performs the following tasks:
%   1. Open Serial port from comport input variable
%   2. Creates .CSV file and logs all recived telemetery into it at 1Hz
%   3. Outputs csvfile log name for reference
%   4. alsoo outputs timer object for reference
display ('Connecting ...');

delete (instrfind);
ard = serial(comport);
set (ard, 'DataBits', 8);
set (ard, 'StopBits', 1);
set (ard, 'BaudRate', 19200);
set (ard, 'Parity', 'none');
set (ard, 'InputBufferSize', 1000000);

try %To stop and indicate that Radio is not connected
fopen (ard) %Open Comport
error = false;
catch %if there is an errror in try
error = true; 
msgbox ('No Serial Device on selected COM port, Blafhff'); %Reas the string for info
end

if (error == false)
msgbox ('Serial Connected!!,,yah!');  %Indicate connection ws a sucess  
delete (timerfindall); %Delete all timer objects
csvfilename = datestr(datetime); %Get date and time for name of new file
csvfilename = strrep(csvfilename, ':', '_')
table_filename = csvfilename;
csvfile = fopen(strcat (csvfilename,'.csv'), 'a+'); %Open Csv file, only once we need to do this
onesecCSVlogger = timer('TimerFcn',{@LoopTimer_1s, ard, csvfile, handles, table_filename},... 
                        'ExecutionMode','fixedRate','Period', 1); 
%Call csvlogger function every 1 sec period with ard(Serial port) and csvfilelog (name of csv file) as input 
start (onesecCSVlogger);
end



end


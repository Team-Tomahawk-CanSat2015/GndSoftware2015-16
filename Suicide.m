function [data] = Suicide(csvfile, csvfilename)

%  fclose ('all');
%  csvfile = fopen('22-Dec-2015 18_02_35.csv');
fullcsvfilename  =  strcat (csvfilename, '.csv');
data = textscan(fopen(fullcsvfilename), '%s');
data_str = data{1};

%mat_e = cell2mat (data_str(1));
t=0; j=0; i=0; k=1;
[A B] = size(data_str);
Kappa = ones(A,18);

for i = 1:1:A
mat_e = cell2mat(data_str(i));
k = 1; commacount = 0;
while (k < numel(mat_e) && commacount<18 ) %CHANGE THIS HSIT)
    d = mat_e (k);
  
    while (d ~= ',' && commacount<18 )
        t = t+1;
        k = k+1;
        d = mat_e(k);    
    end 
    
    if (d == ',')
           commacount = commacount + 1;
    end
    buff = mat_e(1:k);
    k = k+1;
    
end
imat = str2num (buff);
Kappa(i,:) = imat;
data = Kappa;
end

end

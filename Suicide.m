function [data] = Suicide(csvfile, csvfilename)

%  fclose ('all');
%  csvfile = fopen('22-Dec-2015 18_02_35.csv');
fullcsvfilename  =  strcat (csvfilename, '.csv');
data = textscan(fopen(fullcsvfilename), '%s');
data_str = data{1};
n_comma = 14;
%mat_e = cell2mat (data_str(1));
t=0; j=0; i=0; k=1;
[A B] = size(data_str);
Kappa = ones(A,n_comma);
Error =0;
for i = 1:1:A
mat_e = cell2mat(data_str(i));
k = 1; commacount = 0;
while (k < numel(mat_e) && commacount<n_comma ) %CHANGE THIS HSIT)
    d = mat_e (k);
    if(isstrprop(d, 'digit')==0 && d~='.')
       buff = '0';
       Error = 1;
    end
    
    while (d ~= ',' && commacount<n_comma )
        t = t+1;
        k = k+1;
        d = mat_e(k);    
    end 
    
    if (d == ',')
           commacount = commacount + 1;
    end
    
    if Error == 0
    buff = mat_e(1:k);
    k = k+1;
    end
end
imat = str2num (buff);
Kappa(i,:) = imat;
data = Kappa;
end

end

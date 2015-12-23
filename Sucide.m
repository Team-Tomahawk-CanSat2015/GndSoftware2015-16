fclose ('all');
a = fopen('22-Dec-2015 18_02_35.csv');
data = textscan(a, '%s');
data_str = data{1};

iscellstr(data_str(1));
data_str (2)
mat_e = cell2mat (data_str(1));
t=0; j=0; i=0;
k=1;
[A B] = size(data_str);

for i = 1:1:A
mat_e = cell2mat (data_str(i));
k = 1; commacount = 0;
while (k < numel(mat_e)) %CHANGE THIS HSIT)
    d = mat_e (k);
    while (d ~= ',' && commacount<19 )
       if (d == ',')
           commacount = commacount + 1;
       end
        t = t+1;
        k = k+1;
        d = mat_e(k);    
    end 
    buff = mat_e(1:k);
    k = k+1;
    
end
buff
imat = str2num (buff);

end


   






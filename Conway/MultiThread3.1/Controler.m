%1-Dimensional Transform.
data = zeros(10000,1);
S = ones(100,100,3);
S(1,2,1:3)=0;
S(2,2,1:3)=0;
S(3,2,1:3)=0;
S(5,5,1:3)=0;
S(6,4,1:3)=0;
S(7,4,1:3)=0;
S(8,5,1:3)=0;
S(8,6,1:3)=0;
S(6,6,1:3)=0;
S(7,7,1:3)=0;
S(10,10,1:3)=0;
S(10,11,1:3)=0;
S(10,12,1:3)=0;
S(9,12,1:3)=0;
S(8,11,1:3)=0;

for ii = 1:100
    data((100*ii-99):100*ii)=S(1:100,ii);
end
clear ii;
%Main Matrix(Edit) X.
fi = fopen('X.dat','w');
fwrite(fi,data,'double');
fclose(fi);
X = memmapfile('X.dat','Writable', true,'Format','double');
%SnapShot to previous X.
fi = fopen('Y.dat','w');
fwrite(fi,data,'double');
fclose(fi);
Y = memmapfile('Y.dat','Writable', true, 'Format', 'double');

%WR Controler.
fi = fopen('WR.dat','w');
clear data;
data = zeros(5,1);
fwrite(fi,data,'double');
fclose(fi);     
WR = memmapfile('WR.dat','Writable', true, 'Format', 'double');

%CT Controler
fi = fopen('CT.dat','w');
clear data;
data = zeros(5000,1);
fwrite(fi,data,'double');
fclose(fi);     
CT = memmapfile('CT.dat','Writable', true, 'Format', 'double');

%T1 Controler
fi = fopen('T1.dat','w');
clear data;
data = zeros(5000,1);
fwrite(fi,data,'double');
fclose(fi);     
T1 = memmapfile('T1.dat','Writable', true, 'Format', 'double');

%T2 Controler
fi = fopen('T2.dat','w');
clear data;
data = zeros(5000,1);
fwrite(fi,data,'double');
fclose(fi);     
T2 = memmapfile('T2.dat','Writable', true, 'Format', 'double');


clear data;
clear S;
clear fi;

while true
    try
        if(exist('ct.csv')~=0)
            tic
            csvwrite('t1.csv',[]);
            csvwrite('t2.csv',[]);
            disp("sent"+k);
            while(exist('t1.csv')~=0)
                %skip
            end
            
            temp1 = T1.data;
%            temp2 = T2.data;
%            CT.data = [temp1 temp2];
            X.data=temp1;
            k = toc
            if(k<0.2)
                pause(0.2-k)
            end
            eval(['!rm' 32 'ct.cs v']);

        end
    catch
%        disp("Error");
    end
end
    


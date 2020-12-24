%Main Thread.

%%Suspan all exist process.
eval(['!rm' 32 't1.csv']) %Turn off main Calculation Thread1
eval(['!rm' 32 't2.csv']) %Turn off main Calculation Thread2
eval(['!rm' 32 'PlayerIO.csv']) %Turn off Player IO.
eval(['!rm' 32 'Main.csv']) %Turn off itself's checksum

%init the variation.
X = ones(100,100,3);
X(1,2,1:3)=0;
X(2,2,1:3)=0;
X(3,2,1:3)=0;
X(5,5,1:3)=0;
X(6,4,1:3)=0;
X(7,4,1:3)=0;
X(8,5,1:3)=0;
X(8,6,1:3)=0;
X(6,6,1:3)=0;
X(7,7,1:3)=0;
X(10,10,1:3)=0;
X(10,11,1:3)=0;
X(10,12,1:3)=0;
X(9,12,1:3)=0;
X(8,11,1:3)=0;
image(X);
drawnow;
csvwrite('sharedmem.csv',X);

%Rearr, boot process.
A = [];
csvwrite('PlayerIO.csv',A);
%csvwrite('t1.csv',A)
%csvwrite('t2.csv',A)
csvwrite('t1_2.csv',A);
csvwrite('t2_2.csv',A);
csvwrite('Main.csv',A);
disp('booted')
%Boot itself.
while true
    if(exist('Main.csv')~=0)

        

        csvwrite('sharedmem2.csv',X);
        try
            eval(['!mv' 32 't2_2.csv' 32 't2_1.csv']);
        catch
            disp('');
        end
        csvwrite('t2.csv',A);
        while (exist('t2_2.csv')~=0)
            break;
        end
        
        try
            eval(['!mv' 32 't1_2.csv' 32 't1_1.csv']);
        catch
            disp('');
        end
        csvwrite('t1.csv',A);
        while (exist('t1_2.csv')~=0)
            break;
        end
        
        while true
            if((exist('t1.csv')==0)&&(exist('t2.csv')==0));
                break;
            end
        end
        S1 = csvread('sharedmemt1.csv');
        S2 = csvread('sharedmemt2.csv');
        S = [S1;S2];
%        S = csvread('sharedmem.csv');
        X(1:100,1:100,1)=S(1:100,1:100);
        X(1:100,1:100,2)=S(1:100,101:200);
        X(1:100,1:100,3)=S(1:100,201:300);
        disp("image Draw")
        image(X);
        drawnow;
        
    else
        if(exist("userIO.csv"))
            disp("interrupt")
        end
        
        
       
        
        
        
%            else
%        [A,B,BUTTON]=ginput(1);
%        if BUTTON == 98
%            eval(['!mv' 32 'PlayerIO.csv' 32 't2.csv']) %Release.
%        end
%        if BUTTON == 66
%            eval(['!mv' 32 'PlayerIO.csv' 32 't2.csv']) %Release.
%        end 
%        if(A<100)
%            if(B<100)                
%                X(round(B),round(A),1:3)=0;
%                image(X);drawnow;
%            end
%        end
%    csvwrite('sharedmem.csv',X);

        
    end
end


%function keypress

%figure keypressfun



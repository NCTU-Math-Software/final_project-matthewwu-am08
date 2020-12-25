        %100m100
        %% Create initial.
%        count=0;
%        tic
X = zeros(50,100,3);
while true
    if(exist('t1.csv')~=0)
%        disp("caling");
        S = csvread('sharedmem2.csv');
        eval(['!mv' 32 't1_1.csv' 32 't1_2.csv'])
        disp('readed');
        X(1:51,1:100,1)=S(1:51,1:100);
        X(1:51,1:100,2)=S(1:51,101:200);
        X(1:51,1:100,3)=S(1:51,201:300);
%        image(X);
        Y = X; %Snapshot X's condition.
        for ii = 1:50
            for jj = 1:100
                if(X(ii,jj,1)==0)
                    if(zpg(ii,jj,Y)<2)
                        X(ii,jj,1:3)=1; %death.
                    end
                    if(zpg(ii,jj,Y)>3)
                        X(ii,jj,1:3)=1; %death.
                    end
                end
                if(X(ii,jj,1)==1)
                    if(zpg(ii,jj,Y)==3)
                        X(ii,jj,1:3)=0; %burn
                    end
                end
            end
        end
%        image(X);
%        drawnow;
        csvwrite('sharedmemt1.csv',X(1:50,1:100,1:3));
        
        %Remove itself's bootcmp
        eval(['!rm' 32 't1.csv']);
        
%    clear;
        
%        if(count==20)
%            k=toc
%        end
    end
    
    %disp(zpg(1,100,X));
end

    function sum = zpg(a,b,X)
        sum = 0;
        try
            k=X(a-1,b-1);
        catch
            k=1;
        end
        sum = sum+k;
        try
            k=X(a-1,b);
        catch
            k=1;
        end
        sum = sum+k;
            try
            k=X(a-1,b+1);
        catch
            k=1;
        end
        sum = sum+k;

           try
            k=X(a,b+1);
        catch
            k=1;
        end
        sum = sum+k;
        try
            k=X(a,b-1);
        catch
            k=1;
        end
        sum = sum+k;
        try
            k=X(a+1,b-1);
        catch
            k=1;
        end
        sum = sum+k;
        try
            k=X(a+1,b);
        catch
            k=1;
        end
        sum = sum+k;
        try
            k=X(a+1,b+1);
        catch
            k=1;
        end
        sum = sum+k;
        sum = 8 - sum;
    end

%rdData = csvread('123.csv');
%csvwrite('123.csv',B);cclear
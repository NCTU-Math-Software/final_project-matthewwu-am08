%100m100
%% Create initial.
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

%loop.
while true
    Y = X; %Snapshot X's condition.
    for ii = 1:100
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
    image(X);drawnow;
end
%disp(zpg(1,100,X));


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


size = 25;

%% Create initial.
X = ones(size,size,3);
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

while true
    [tx ty KEY] = ginput(1)
    if(KEY==32)
        break
    end
    if(KEY == 82||KEY==114)
        X = ones(size,size,3);
        image(X); drawnow;
        continue;
    end
    if(X(round(ty),round(tx),1)==1)
        X(round(ty),round(tx),1:3)=0;
    else
        X(round(ty),round(tx),1:3)=1;
    end
    
    image(X);drawnow;
%loop.
end
while true
    tic;
    Y = X; %Snapshot X's condition.
    for ii=1:size
        for jj = 1:size
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
    image(X);
    drawnow;
    toc
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



X = memmapfile('X.dat','Writable', true,'Format','double');
Y = memmapfile('Y.dat','Writable', true,'Format','double');
WR = memmapfile('WR.dat','Writable', true,'Format','double');

while true
    try
        if(exist('t2.csv')~=0)
            disp("Load");
            tic
            tx = X.data;
            ty = Y.data;

            %Rebuild to matrix.
            x = ones(100,100,3);
            y = ones(100,100,3);
            for ii = 1:100
                x(1:100,ii,1) = tx((100*ii-99):100*ii);
                x(1:100,ii,2) = tx((100*ii-99):100*ii);
                x(1:100,ii,3) = tx((100*ii-99):100*ii);
                y(1:100,ii,1) = ty((100*ii-99):100*ii);
                y(1:100,ii,2) = ty((100*ii-99):100*ii);
                y(1:100,ii,3) = ty((100*ii-99):100*ii);
            end
            %Calculation.
            for(ii=1:100)
                for jj = 1:100
                    if(x(ii,jj,1)==0)
                        if(zpg(ii,jj,y)<2)
                            x(ii,jj,1:3)=1; %death.
                        end
                        if(zpg(ii,jj,y)>3)
                            x(ii,jj,1:3)=1; %death.
                        end
                    end
                    if(x(ii,jj,1)==1)
                        if(zpg(ii,jj,y)==3)
                            x(ii,jj,1:3)=0; %burn=
                        end
                    end
                end
            end
        %    data = zeros(10000,1);
    %        image(x);drawnow;

            %Resize to a line.
            for ii = 1:100
                tx((100*ii-99):100*ii)=x(1:100,ii);
            end
            X.data = tx;
    %        Y.data = tx;
%            WR.data(2)=2;
            eval(['!del' 32 't2.csv']);
            toc
        end
    end
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
%% This is Main Theread, Control Inital, userIO, and Display the result.
X = memmapfile('X.dat','Writable', true,'Format','double');
Y = memmapfile('Y.dat','Writable', true,'Format','double');
WR = memmapfile('WR.dat','Writable', true,'Format','double');
T1 = memmapfile('T1.dat','Writable', true, 'Format', 'double');
CT = memmapfile('CT.dat','Writable', true, 'Format', 'double');

%% Inits.
%Create the main savement for Main Matrix

%initial conditions.

tic


%% Timer Function Declaration.
t_timer = timer('TimerFcn', {@TimerFcn1,X,Y,WR}, 'StartDelay',0.001);
t_timer.Period=0.2;
t_timer.TasksToExecute=5000000000;
t_timer.ExecutionMode='fixedRate';
k = toc;
disp("Init Done, spend" +k + " second")
clear k;

%% Start Main.
while true
    %Call the TImer.
%    disp("Timer Call");
    start(t_timer);

    KEY = 0;
    while(KEY~=32)
        try
            [ux uy KEY ]= ginput(1);
        end
    end
    stop(t_timer);
%    x(round(uy),round(ux),1:3)=0; %space key 32.
    tx = X.data;
    for ii = 1:100
        x(1:100,ii,1) = tx((100*ii-99):100*ii);
        x(1:100,ii,2) = tx((100*ii-99):100*ii);
        x(1:100,ii,3) = tx((100*ii-99):100*ii);
    end
    image(x);drawnow;
    KEY = 0;
    while KEY~=32
        [ux uy KEY] = ginput(1);
        if(KEY==82)
            %r = 114  R = 82
            x = ones(100,100,3);
        end
        if(KEY==114)
            x = ones(100,100,3);
        end
        if(KEY==103) %g
            break;
        end
        if(KEY==71) %G
            break;
        end
        x(round(uy),round(ux),1:3)=0; %space key 32.
        
        image(x);
        drawnow;
    end
    if(KEY~=32) %Means this is from break function.
        close all;
        break;
    end
    
    %Rebuild to line and save to public.
    for ii = 1:100
        tx((100*ii-99):100*ii)=x(1:100,ii);
    end
    X.data = tx;
    Y.data = tx;
        
    
    %Repack to line.
    for ii = 1:100
        tx((100*ii-99):100*ii)=x(1:100,ii);
    end
    disp("Repaced");

end
function TimerFcn1(obj,event,X,Y,WR)
%        tic;
%        disp("Timer Func1 Load")
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
        %Plot
        image(x);drawnow;
        Y.data = X.data;
        
        %Sent out next round's calculation.
        csvwrite('ct.csv',[]);
%        disp("Calced");
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
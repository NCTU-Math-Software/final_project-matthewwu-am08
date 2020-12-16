%lantern ants.
X=[];
size=200;
X = ones(size,size,3); %0 = black, 1 = white.
image(X)
% if white>> turn right, if black, turn left.

ants1X=size/2; %original point: left up point, x is vertical
ants1Y=size/2; % y is horizontal;
ants1s = 1;  %0 default is up
%%
for ii = 1:50000000
%    disp("currentpos: "+X(ants1X,ants1Y,1));
    colorstats=X(ants1X,ants1Y,1); %Get current's color.
    %Draw the color and turn the side.
    if(colorstats==0.8)
        X(ants1X,ants1Y,1)=1;
        X(ants1X,ants1Y,2)=1;
        X(ants1X,ants1Y,3)=1;
        ants1s = ants1s-1;
    end
    
    if(colorstats==1)
        X(ants1X,ants1Y,1)=0.2;
        X(ants1X,ants1Y,2)=1;
        X(ants1X,ants1Y,3)=0;
        ants1s = ants1s+1;
    end
    if(colorstats==0.2)
        X(ants1X,ants1Y,1)=0.8;
        X(ants1X,ants1Y,2)=0;
        X(ants1X,ants1Y,3)=0;
        ants1s=ants1s-1;
    end
    %% Over turn's fix.
    if(ants1s==0)
        ants1s=4;
    end
    if(ants1s==5)
        ants1s=1;
    end
    %% Movement
    if(ants1s==1)
        ants1X=ants1X-1;
    end
    if(ants1s==2)
        ants1Y=ants1Y+1;
    end
    if(ants1s==3)
        ants1X=ants1X+1;
    end
    if(ants1s==4)
        ants1Y=ants1Y-1;
    end
    
    %% Boundary Solve;
    if(ants1X==0)
        ants1X=size;
        continue;
    end
    if(ants1X==size+1)
        ants1X=1;
        continue;
    end
    
    
    if(ants1Y==0)
        ants1Y=size;
        continue;
    end

    if(ants1Y==size+1)
        ants1Y=1;
        continue;
    end
    
    image(X);
    %% step draw.
    if(mod(ii,10)==0)
        drawnow;
    end
%    drawnow;
%    disp(ants1s);
%    pause(0.01);
end
        
        
        
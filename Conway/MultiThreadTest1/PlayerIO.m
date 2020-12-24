while true
    if(exist('PlayerIO.csv')~=0)
        [A,B,BUTTON]=ginput(1);
        if(BUTTON==32)
            close all;
            break
        end
        if(BUTTON==97)
            eval(['!mv' 32 't2.csv' 32 'PlayerIO.csv'])
        end
        if(BUTTON==98)
            eval(['!mv' 32 'PlayerIO.csv' 32 't2.csv'])
        end
    end
end





%eval(['!mv' 32 't1.csv' 32 't2.csv'])

%rdData = csvread('123.csv');
%csvwrite('123.csv',B);cclear

    
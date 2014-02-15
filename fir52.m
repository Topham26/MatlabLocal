function b = my_fir1(handles)
%% FilterType
filterType=get(handles.popupFilterType,'String');
filterVal=get(handles.popupFilterType,'Value');
filterType=filterType{filterVal};
Fs=str2num(get(handles.editFs,'String'));
  
% Amplitude Breakpoints
if strcmp(filterType,'LPF') % Low Pass Filter
    m=[1 1 0 0];  
elseif strcmp(filterType,'BPF') % Band Pass Filter
    m=[0 1 1 0]; 
elseif strcmp(filterType,'HPF') % High Pass Filter
    m=[0 0 1 1];     
elseif strcmp(filterType,'BSF') % Band Stop Filter
    m=[1 0 0 1];
end

omega=str2num(get(handles.editOmega,'String'));
if get(handles.checkLinear,'Value')
    omega=(omega*2*pi)/Fs;
end
omegaP=omega(1);
omegaS=omega(2);
f=[0 omegaP omegaS 1];
deltaOmega=omegaS-omegaP;

% Frequency breakpoints
delta=str2num(get(handles.editDelta,'String'));
deltaP=delta(1);
deltaS=delta(2);


if strcmp(filterType,'Arbitrary')
    set(handles.editOmega,'Tag','editFrequencies');
    set(handles.editDelta,'Tag','editMagnitudes');
    m=str2num(get(handles.editMagnitudes,'String'));
    f=str2num(get(handles.editFrequencies,'String'));
    if get(handles.checkLinear,'Value')
    f=(f*2*pi)/Fs;
    end
end
%% Window Type
windowType=get(handles.popupWindow,'String');
windowVal=get(handles.popupWindow,'Value');
windowType=windowType{windowVal};

% Order of Filter
M=str2double(get(handles.editOrder,'String'));

% Sidelobe attenuation (Kaizer)
    
if strcmp(windowType,'Kaizer') 
    As=-20*log10(min(deltaS,deltaP));
    if ~get(handles.betaSelfCalcCheck,'Value')
        beta=str2double(get(handles.editBeta,'String'));
    else
        if As>50
            beta=0.1102*(As-8.7);
        elseif As>21
            beta=(0.5842*(As-21)^0.4)+(0.07886*(As-21));
        elseif As<21
            beta=0;
        end
    end   
    if As>21
        M=round(As-7.95/(2.285*deltaOmega));
    else
        M=round(5.79/deltaOmega)-1;
    end
    WIN=kaiser(M+1,beta);
    b=fir2(M,f,m,WIN);
elseif strcmp(windowType,'Rectangular')
    WIN=rectwin(M+1);
    b=fir2(M,f,m,WIN);
elseif strcmp(windowType,'Hamming') 
    WIN=hamming(M+1);
    b=fir2(M,f,m,WIN);
elseif strcmp(windowType,'Hanning')
    WIN=hanning(M+1);
    b=fir2(M,f,m,WIN);
elseif strcmp(windowType,'Bartlett')
    WIN=bartlett(M+1);
    b=fir2(M,f,m,WIN);
elseif strcmp(windowType,'Blackman')
    WIN=blackman(M+1);
    b=fir2(M,f,m,WIN);
end

%% FIR2



% 
% Fs=str2double(get(handles.editFs,'String'));
% deltaS=str2double(get(handles.editDeltaS,'String'));

end


function varargout = Lab08_GUI(varargin)
% LAB08_GUI MATLAB code for Lab08_GUI.fig
%      LAB08_GUI, by itself, creates a new LAB08_GUI or raises the existing
%      singleton*.
%
%      H = LAB08_GUI returns the handle to a new LAB08_GUI or the handle to
%      the existing singleton*.
%
%      LAB08_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB08_GUI.M with the given input arguments.
%
%      LAB08_GUI('Property','Value',...) creates a new LAB08_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lab08_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lab08_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above textMinStopband to modify the response to help Lab08_GUI

% Last Modified by GUIDE v2.5 09-Oct-2013 16:42:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Lab08_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Lab08_GUI_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Lab08_GUI is made visible.
function Lab08_GUI_OpeningFcn(hObject, eventdata, handles, varargin)

% Default Values
% set(handles.editDelta,'String','omega p, omega s');
% set(handles.editOmega,'String','delta p, delta s');

% Hide Beta
set(handles.textBeta,'Visible','off');
set(handles.editBeta,'Visible','off');
set(handles.betaSelfCalcCheck,'Visible','off');

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lab08_GUI (see VARARGIN)

% Choose default command line output for Lab08_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lab08_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Lab08_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editFs_Callback(hObject, eventdata, handles)
% hObject    handle to editFs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFs as textMinStopband
%        str2double(get(hObject,'String')) returns contents of editFs as a double


% --- Executes during object creation, after setting all properties.
function editFs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editOmega_Callback(hObject, eventdata, handles)
% hObject    handle to editOmega (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOmega as textMinStopband
%        str2double(get(hObject,'String')) returns contents of editOmega as a double


% --- Executes during object creation, after setting all properties.
function editOmega_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOmega (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupFilterType.
function popupFilterType_Callback(hObject, eventdata, handles)
filterType=get(handles.popupFilterType,'String');
filterVal=get(handles.popupFilterType,'Value');
filterType=filterType{filterVal};

if strcmp(filterType,'Arbitrary')
    set(handles.textEdgeFreq,'String','Arbitrary Frequency');
    set(handles.textMinStopband,'String','Arbitrary Amplitude');
%     set(handles.editDelta,'String','a1,a2,...,an');
%     set(handles.editOmega,'String','f1,f2,...,fn');
else
    set(handles.textEdgeFreq,'String','Edge Frequency');
    set(handles.textMinStopband,'String','Minimum Stopband Atten.');
%     set(handles.editDelta,'String','omega p, omega s');
%     set(handles.editOmega,'String','delta p, delta s');
    set(handles.editDelta,'ForegroundColor','k');
    set(handles.editOmega,'ForegroundColor','k');
end


% --- Executes during object creation, after setting all properties.
function popupFilterType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupFilterType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editWs_Callback(hObject, eventdata, handles)
% hObject    handle to editWs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editWs as textMinStopband
%        str2double(get(hObject,'String')) returns contents of editWs as a double


% --- Executes during object creation, after setting all properties.
function editWs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editWs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDelta_Callback(hObject, eventdata, handles)
% hObject    handle to editDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDelta as textMinStopband
%        str2double(get(hObject,'String')) returns contents of editDelta as a double


% --- Executes during object creation, after setting all properties.
function editDelta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listFilterCoeff.
function listFilterCoeff_Callback(hObject, eventdata, handles)
% hObject    handle to listFilterCoeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listFilterCoeff contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listFilterCoeff


% --- Executes during object creation, after setting all properties.
function listFilterCoeff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listFilterCoeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupWindow.
function popupWindow_Callback(hObject, eventdata, handles)
windowType=get(handles.popupWindow,'String');
windowVal=get(handles.popupWindow,'Value');
windowType=windowType{windowVal};

if strcmp(windowType,'Kaizer')
    set(handles.textBeta,'Visible','on');
    set(handles.editBeta,'Visible','on');
    set(handles.betaSelfCalcCheck,'Visible','on');

else
    set(handles.textBeta,'Visible','off');
    set(handles.editBeta,'Visible','off');
    set(handles.betaSelfCalcCheck,'Visible','off');

end
% hObject    handle to popupWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupWindow contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupWindow


% --- Executes during object creation, after setting all properties.
function popupWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editOrder_Callback(hObject, eventdata, handles)
% hObject    handle to editOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOrder as textMinStopband
%        str2double(get(hObject,'String')) returns contents of editOrder as a double


% --- Executes during object creation, after setting all properties.
function editOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBeta_Callback(hObject, eventdata, handles)
% hObject    handle to editBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBeta as textMinStopband
%        str2double(get(hObject,'String')) returns contents of editBeta as a double


% --- Executes during object creation, after setting all properties.
function editBeta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Update.
function Update_Callback(hObject, eventdata, handles)
filterType=get(handles.popupFilterType,'String');
filterVal=get(handles.popupFilterType,'Value');
filterType=filterType{filterVal};

if strcmp(filterType,'Arbitrary')
    amplitudes=str2num(get(handles.editDelta,'String'));
    frequencies=str2num(get(handles.editOmega,'String'));
    if length(frequencies)~=length(amplitudes) ;
        set(handles.editDelta,'ForegroundColor',[1 0 0])
        set(handles.editOmega,'ForegroundColor',[1 0 0])
        return
    else
        set(handles.editDelta,'ForegroundColor','k')
        set(handles.editOmega,'ForegroundColor','k')
    end
end

global b
b=my_fir1(handles)';
bindex=0:length(b)-1;
bindex=strcat('b',num2str(bindex'),':  ');
bInfo=strcat(bindex,num2str(b));
set(handles.listFilterCoeff,'String',bInfo);
uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% get(get(handles.uipanel1,'SelectedObject'),'String')



% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
global b
Selection=get(hObject,'String');
if strcmp(Selection,'Impulse Response')
    [h,t]=impz(b,1);
    stem(handles.axes1,t,h);
    title(handles.axes1,'Impulse Response');
    xlabel(handles.axes1,'Order');
    ylabel(handles.axes1,'Amplitude');
elseif strcmp(Selection,'Magnitude Response')
    [H,w]=freqz(b,1);
    plot(handles.axes1,w/pi,abs(H));
    title(handles.axes1,'Magnitude Response');
    xlabel(handles.axes1,'Normalized Frequency (x/pi rad/sample)');
    ylabel(handles.axes1,'|H(z)|');
elseif strcmp(Selection,'Gain Response')
    [H,w]=freqz(b,1);
    plot(handles.axes1,w/pi,20*log10(H));
    title(handles.axes1,'Gain Response');
    xlabel(handles.axes1,'Normalized Frequency (x/pi rad/sample)');
    ylabel(handles.axes1,'Magnitude dB');
elseif strcmp(Selection,'Phase Response')
    [H,w]=freqz(b,1);
    plot(handles.axes1,w/pi,rad2deg(angle(H)));
    title(handles.axes1,'Phase Response');
    xlabel(handles.axes1,'Normalized Frequency (x/pi rad/sample)');
    ylabel(handles.axes1,'Phase (degrees)');
elseif strcmp(Selection,'Zero-Pole Plot')
    figure
    zplane(b,1);
    title('Zero-Pole Plot');
elseif strcmp(Selection,'Group/Phase Delay')
    [gd,w]=grpdelay(b);
    plot(handles.axes1,w/pi,gd);
    title(handles.axes1,'Group/Phase Delay');
    xlabel(handles.axes1,'Normalized Frequency (x/pi rad/sample)');
    ylabel(handles.axes1,'Group Delay (samples)');
end

% hObject    handle to the selected object in uipanel1
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in betaSelfCalcCheck.
function betaSelfCalcCheck_Callback(hObject, eventdata, handles)
% hObject    handle to betaSelfCalcCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of betaSelfCalcCheck


% --- Executes on button press in checkLinear.
function checkLinear_Callback(hObject, eventdata, handles)
% hObject    handle to checkLinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkLinear


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Update.
function Update_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

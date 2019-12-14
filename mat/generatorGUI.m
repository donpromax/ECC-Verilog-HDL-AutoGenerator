function varargout = generatorGUI(varargin)
    % GENERATORGUI MATLAB code for generatorGUI.fig
    %      GENERATORGUI, by itself, creates a new GENERATORGUI or raises the existing
    %      singleton*.
    %
    %      H = GENERATORGUI returns the handle to a new GENERATORGUI or the handle to
    %      the existing singleton*.
    %
    %      GENERATORGUI('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in GENERATORGUI.M with the given input arguments.
    %
    %      GENERATORGUI('Property','Value',...) creates a new GENERATORGUI or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before generatorGUI_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to generatorGUI_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help generatorGUI
    
    % Last Modified by GUIDE v2.5 14-Dec-2019 15:17:54
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @generatorGUI_OpeningFcn, ...
        'gui_OutputFcn',  @generatorGUI_OutputFcn, ...
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
    
    
    % --- Executes just before generatorGUI is made visible.
function generatorGUI_OpeningFcn(hObject, ~, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to generatorGUI (see VARARGIN)
    
    % Choose default command line output for generatorGUI
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes generatorGUI wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = generatorGUI_OutputFcn(~, ~, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    
    
    
function edit1_Callback(~, ~, ~)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit1 as text
    %        str2double(get(hObject,'String')) returns contents of edit1 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit2_Callback(hObject, eventdata, handles)
    % hObject    handle to edit2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit2 as text
    %        str2double(get(hObject,'String')) returns contents of edit2 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
    
    
    % --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
    % hObject    handle to Untitled_1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function DataMatrix_Callback(hObject, eventdata, handles)
    % hObject    handle to DataMatrix (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    M = getDataMatrix(poly,len_data,len_crc);
    set(handles.uitable1,'Data',M);
    set(handles.uitable1,'ColumnWidth',{40});
    rowName = strings(len_crc);
    columnName = strings(len_data);
    for i=0:len_data-1
        columnName(i+1) = ['d[',num2str(i),']'];
    end
    for i=0:len_crc-1
        rowName(i+1) = ['crc[',num2str(i),']'];
    end
    set(handles.uitable1,'RowName',rowName);
    set(handles.uitable1,'ColumnName',columnName);
    
    % --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
    % hObject    handle to Untitled_4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function GenerateHardwareCode_Callback(hObject, eventdata, handles)
    % hObject    handle to GenerateHardwareCode (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function ErrorResidueMapHex_Callback(hObject, eventdata, handles)
    % hObject    handle to ErrorResidueMapHex (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    Map = errorBitMap(poly,len_data,len_crc,'h');
    set(handles.uitable1,'Data',Map);
    set(handles.uitable1,'ColumnName',{'余数'});
    set(handles.uitable1,'ColumnWidth',{len_crc*3});
    rowName = strings(len_crc+len_data);
    for i=0:len_crc-1
        rowName(i+1) = ['crc[',num2str(i),']'];
    end
    for i=len_crc:len_crc+len_data-1
        rowName(i+1) = ['data[',num2str(i-len_crc),']'];
    end
    set(handles.uitable1,'RowName',rowName);
    % --------------------------------------------------------------------
function CrcMatrix_Callback(hObject, eventdata, handles)
    % hObject    handle to CrcMatrix (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    M = getCrcMatrix(poly,len_data,len_crc);
    set(handles.uitable1,'Data',M);
    set(handles.uitable1,'ColumnWidth',{40});
    rowName = strings(len_crc);
    columnName = strings(len_data);
    for i=0:len_data-1
        columnName(i+1) = ['c[',num2str(i),']'];
    end
    for i=0:len_crc-1
        rowName(i+1) = ['crc[',num2str(i),']'];
    end
    set(handles.uitable1,'RowName',rowName);
    set(handles.uitable1,'ColumnName',columnName);
    
    
function edit3_Callback(hObject, eventdata, handles)
    % hObject    handle to edit3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit3 as text
    %        str2double(get(hObject,'String')) returns contents of edit3 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to uitable1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    
    % --------------------------------------------------------------------
function ErrorResidueMapBin_Callback(hObject, eventdata, handles)
    % hObject    handle to ErrorResidueMapBin (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    Map = errorBitMap(poly,len_data,len_crc,'b');
    set(handles.uitable1,'Data',Map);
    set(handles.uitable1,'ColumnName',{'余数'});
    set(handles.uitable1,'ColumnWidth',{len_crc*10});
    rowName = strings(len_crc+len_data);
    for i=0:len_crc-1
        rowName(i+1) = ['crc[',num2str(i),']'];
    end
    for i=len_crc:len_crc+len_data-1
        rowName(i+1) = ['data[',num2str(i-len_crc),']'];
    end
    set(handles.uitable1,'RowName',rowName);
    
    
    % --------------------------------------------------------------------
function calcrc_Callback(hObject, eventdata, handles)
    % hObject    handle to calcrc (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    answer = inputdlg({'请输入信息(0x/0b/dec):','请输入crc初值（一般为0）'},...
        '计算校验位',1,{'0x','0'});
    dividend = str2num(cell2mat(answer(1)));
    crc_init = str2num(cell2mat(answer(2)));
    crc = module2divide(dividend,poly,crc_init,len_data,len_crc);
    crc_hex = arr2hex(crc,ceil(len_crc/4));
    crc_bin = arr2bin(crc,len_crc);
    message = ['hex: ',crc_hex,"",'bin: ',crc_bin];
    helpdlg(message,'crc计算结果');
    
    
    
    % --------------------------------------------------------------------
function generateEncoder_Callback(hObject, eventdata, handles)
    % hObject    handle to generateEncoder (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    verilogGenerator(poly,len_data,len_crc);
    
    % --------------------------------------------------------------------
function generateDecoder_Callback(hObject, eventdata, handles)
    % hObject    handle to generateDecoder (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    poly = str2num(get(handles.edit1,'String'));
    len_data = str2num(get(handles.edit2,'String'));
    len_crc = length(dec2bin(poly));
    decodeVerilogGenerator(poly,len_data,len_crc);

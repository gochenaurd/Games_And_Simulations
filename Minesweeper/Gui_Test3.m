function varargout = Gui_Test3(varargin)
% GUI_TEST3 MATLAB code for Gui_Test3.fig
%      GUI_TEST3, by itself, creates a new GUI_TEST3 or raises the existing
%      singleton*.
%
%      H = GUI_TEST3 returns the handle to a new GUI_TEST3 or the handle to
%      the existing singleton*.
%
%      GUI_TEST3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEST3.M with the given input arguments.
%
%      GUI_TEST3('Property','Value',...) creates a new GUI_TEST3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_Test3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_Test3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_Test3

% Last Modified by GUIDE v2.5 16-May-2018 23:45:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_Test3_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_Test3_OutputFcn, ...
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


% --- Executes just before Gui_Test3 is made visible.
function Gui_Test3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_Test3 (see VARARGIN)

% Choose default command line output for Gui_Test3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_Test3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Gui_Test3_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rowSize = 9;
colSize = 9;
numBombs = 15;
gameWin = 1;
gameLoss = -1;
winState = 0;

global guess;

bombArray = zeros(rowSize, colSize);
printArrayNum(1:rowSize, 1:colSize) = 100;
setText(printArrayNum, handles, winState);

set(handles.timer, 'String', '0.0');
set(handles.resultBox, 'String', '   ');

refreshButtons = findall(gcf, 'String', '   ');
set(refreshButtons, 'BackgroundColor', [0.94 0.94 0.94]);
set(refreshButtons, 'ForegroundColor', 'k');

pause(0.08);
printOpening()

[printArrayNum] = initialPrintArray(rowSize, colSize);
printPrintArray(printArrayNum);

fprintf('\nEnter a row and column vector: ');
waitforbuttonpress;
pause(0.08);

tic;
set(handles.timer, 'String', num2str(toc, '%.1f'));

bombArray = setBombs(rowSize, colSize, numBombs, guess, bombArray);
bombArray = setCount(bombArray);
printArrayNum = setPrintArray(bombArray, guess, printArrayNum);  
        
while((winState ~= gameWin) && (winState ~= gameLoss))
 
setText(printArrayNum, handles, winState);

fprintf('\nEnter a row and column vector: ');

waitforbuttonpress;
pause(0.08);

set(handles.timer, 'String', num2str(toc, '%.1f'));

printArrayNum = setPrintArray(bombArray, guess, printArrayNum);
winState = winTest(bombArray, printArrayNum, guess, numBombs);

end

printResult(bombArray, printArrayNum, winState, handles);

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in push11.
function push11_Callback(hObject, eventdata, handles)
% hObject    handle to push11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
type = get(gcf, 'selectiontype')

if(type == 'normal')
    guess = [1 1];
else
    guess = [10 10];
end

% --- Executes on button press in push12.
function push12_Callback(hObject, eventdata, handles)
% hObject    handle to push12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 2];

% --- Executes on button press in push13.
function push13_Callback(hObject, eventdata, handles)
% hObject    handle to push13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 3];

% --- Executes on button press in push14.
function push14_Callback(hObject, eventdata, handles)
% hObject    handle to push14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 4];

% --- Executes on button press in push15.
function push15_Callback(hObject, eventdata, handles)
% hObject    handle to push15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 5];

% --- Executes on button press in push16.
function push16_Callback(hObject, eventdata, handles) %#ok<*INUSD>
% hObject    handle to push16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 6];

% --- Executes on button press in push17.
function push17_Callback(hObject, eventdata, handles)
% hObject    handle to push17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 7];

% --- Executes on button press in push18.
function push18_Callback(hObject, eventdata, handles)
% hObject    handle to push18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 8];

% --- Executes on button press in push19.
function push19_Callback(hObject, eventdata, handles)
% hObject    handle to push19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [1 9];

% --- Executes on button press in push21.
function push21_Callback(hObject, eventdata, handles)
% hObject    handle to push21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 1];

% --- Executes on button press in push22.
function push22_Callback(hObject, eventdata, handles)
% hObject    handle to push22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 2];

% --- Executes on button press in push23.
function push23_Callback(hObject, eventdata, handles)
% hObject    handle to push23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 3];

% --- Executes on button press in push24.
function push24_Callback(hObject, eventdata, handles)
% hObject    handle to push24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 4];

% --- Executes on button press in push25.
function push25_Callback(hObject, eventdata, handles)
% hObject    handle to push25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 5];

% --- Executes on button press in push26.
function push26_Callback(hObject, eventdata, handles)
% hObject    handle to push26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 6];

% --- Executes on button press in push27.
function push27_Callback(hObject, eventdata, handles)
% hObject    handle to push27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 7];

% --- Executes on button press in push28.
function push28_Callback(hObject, eventdata, handles)
% hObject    handle to push28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 8];

% --- Executes on button press in push29.
function push29_Callback(hObject, eventdata, handles)
% hObject    handle to push29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [2 9];

% --- Executes on button press in push31.
function push31_Callback(hObject, eventdata, handles)
% hObject    handle to push31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 1];

% --- Executes on button press in push32.
function push32_Callback(hObject, eventdata, handles)
% hObject    handle to push32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 2];

% --- Executes on button press in push33.
function push33_Callback(hObject, eventdata, handles)
% hObject    handle to push33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 3];

% --- Executes on button press in push34.
function push34_Callback(hObject, eventdata, handles)
% hObject    handle to push34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 4];

% --- Executes on button press in push35.
function push35_Callback(hObject, eventdata, handles)
% hObject    handle to push35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 5];

% --- Executes on button press in push36.
function push36_Callback(hObject, eventdata, handles)
% hObject    handle to push36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 6];

% --- Executes on button press in push37.
function push37_Callback(hObject, eventdata, handles)
% hObject    handle to push37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 7];

% --- Executes on button press in push38.
function push38_Callback(hObject, eventdata, handles)
% hObject    handle to push38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 8];

% --- Executes on button press in push39.
function push39_Callback(hObject, eventdata, handles)
% hObject    handle to push39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [3 9];

% --- Executes on button press in push71.
function push71_Callback(hObject, eventdata, handles)
% hObject    handle to push71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 1];

% --- Executes on button press in push42.
function push42_Callback(hObject, eventdata, handles)
% hObject    handle to push42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 2];

% --- Executes on button press in push43.
function push43_Callback(hObject, eventdata, handles)
% hObject    handle to push43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 3];

% --- Executes on button press in push44.
function push44_Callback(hObject, eventdata, handles)
% hObject    handle to push44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 4];

% --- Executes on button press in push45.
function push45_Callback(hObject, eventdata, handles)
% hObject    handle to push45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 5];

% --- Executes on button press in push46.
function push46_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
% hObject    handle to push46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 6];

% --- Executes on button press in push47.
function push47_Callback(hObject, eventdata, handles)
% hObject    handle to push47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 7];

% --- Executes on button press in push48.
function push48_Callback(hObject, eventdata, handles)
% hObject    handle to push48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 8];

% --- Executes on button press in push49.
function push49_Callback(hObject, eventdata, handles)
% hObject    handle to push49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 9];

% --- Executes on button press in push81.
function push81_Callback(hObject, eventdata, handles)
% hObject    handle to push81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 1];

% --- Executes on button press in push52.
function push52_Callback(hObject, eventdata, handles)
% hObject    handle to push52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 2];

% --- Executes on button press in push53.
function push53_Callback(hObject, eventdata, handles)
% hObject    handle to push53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 3];

% --- Executes on button press in push54.
function push54_Callback(hObject, eventdata, handles)
% hObject    handle to push54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 4];

% --- Executes on button press in push55.
function push55_Callback(hObject, eventdata, handles)
% hObject    handle to push55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 5];

% --- Executes on button press in push56.
function push56_Callback(hObject, eventdata, handles)
% hObject    handle to push56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 6];

% --- Executes on button press in push57.
function push57_Callback(hObject, eventdata, handles)
% hObject    handle to push57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 7];

% --- Executes on button press in push58.
function push58_Callback(hObject, eventdata, handles)
% hObject    handle to push58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 8];

% --- Executes on button press in push59.
function push59_Callback(hObject, eventdata, handles)
% hObject    handle to push59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 9];

% --- Executes on button press in push61.
function push61_Callback(hObject, eventdata, handles)
% hObject    handle to push61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 1];

% --- Executes on button press in push62.
function push62_Callback(hObject, eventdata, handles)
% hObject    handle to push62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 2];

% --- Executes on button press in push63.
function push63_Callback(hObject, eventdata, handles)
% hObject    handle to push63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 3];

% --- Executes on button press in push64.
function push64_Callback(hObject, eventdata, handles)
% hObject    handle to push64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 4];

% --- Executes on button press in push65.
function push65_Callback(hObject, eventdata, handles)
% hObject    handle to push65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 5];

% --- Executes on button press in push66.
function push66_Callback(hObject, eventdata, handles)
% hObject    handle to push66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 6];

% --- Executes on button press in push67.
function push67_Callback(hObject, eventdata, handles)
% hObject    handle to push67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 7];

% --- Executes on button press in push68.
function push68_Callback(hObject, eventdata, handles)
% hObject    handle to push68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 8];

% --- Executes on button press in push69.
function push69_Callback(hObject, eventdata, handles)
% hObject    handle to push69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [6 9];

% --- Executes on button press in push41.
function push41_Callback(hObject, eventdata, handles)
% hObject    handle to push41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [4 1];

% --- Executes on button press in push72.
function push72_Callback(hObject, eventdata, handles)
% hObject    handle to push72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 2];

% --- Executes on button press in push73.
function push73_Callback(hObject, eventdata, handles)
% hObject    handle to push73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 3];

% --- Executes on button press in push74.
function push74_Callback(hObject, eventdata, handles)
% hObject    handle to push74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 4];

% --- Executes on button press in push75.
function push75_Callback(hObject, eventdata, handles)
% hObject    handle to push75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 5];

% --- Executes on button press in push76.
function push76_Callback(hObject, eventdata, handles)
% hObject    handle to push76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 6];

% --- Executes on button press in push77.
function push77_Callback(hObject, eventdata, handles)
% hObject    handle to push77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 7];

% --- Executes on button press in push78.
function push78_Callback(hObject, eventdata, handles)
% hObject    handle to push78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 8];

% --- Executes on button press in push79.
function push79_Callback(hObject, eventdata, handles)
% hObject    handle to push79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [7 9];

% --- Executes on button press in push51.
function push51_Callback(hObject, eventdata, handles)
% hObject    handle to push51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [5 1];

% --- Executes on button press in push82.
function push82_Callback(hObject, eventdata, handles)
% hObject    handle to push82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 2];

% --- Executes on button press in push83.
function push83_Callback(hObject, eventdata, handles)
% hObject    handle to push83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 3];

% --- Executes on button press in push84.
function push84_Callback(hObject, eventdata, handles)
% hObject    handle to push84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 4];

% --- Executes on button press in push85.
function push85_Callback(hObject, eventdata, handles)
% hObject    handle to push85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 5];

% --- Executes on button press in push86.
function push86_Callback(hObject, eventdata, handles)
% hObject    handle to push86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 6];

% --- Executes on button press in push87.
function push87_Callback(hObject, eventdata, handles)
% hObject    handle to push87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 7];

% --- Executes on button press in push88.
function push88_Callback(hObject, eventdata, handles)
% hObject    handle to push88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 8];

% --- Executes on button press in push89.
function push89_Callback(hObject, eventdata, handles)
% hObject    handle to push89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [8 9];

% --- Executes on button press in push91.
function push91_Callback(hObject, eventdata, handles)
% hObject    handle to push91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 1];

% --- Executes on button press in push92.
function push92_Callback(hObject, eventdata, handles)
% hObject    handle to push92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 2];

% --- Executes on button press in push93.
function push93_Callback(hObject, eventdata, handles)
% hObject    handle to push93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 3];

% --- Executes on button press in push94.
function push94_Callback(hObject, eventdata, handles)
% hObject    handle to push94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 4];

% --- Executes on button press in push95.
function push95_Callback(hObject, eventdata, handles)
% hObject    handle to push95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 5];

% --- Executes on button press in push96.
function push96_Callback(hObject, eventdata, handles)
% hObject    handle to push96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 6];

% --- Executes on button press in push97.
function push97_Callback(hObject, eventdata, handles)
% hObject    handle to push97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 7];

% --- Executes on button press in push98.
function push98_Callback(hObject, eventdata, handles)
% hObject    handle to push98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 8];

% --- Executes on button press in push99.
function push99_Callback(hObject, eventdata, handles)
% hObject    handle to push99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
guess = [9 9];


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over push11.
function push11_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to push11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guess 
type = get(gcf, 'selectiontype')

if(type == 'alt')
    guess = [10 10]
end
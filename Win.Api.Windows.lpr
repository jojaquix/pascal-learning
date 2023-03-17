program Win.Api.Windows;

{$mode delphi}{$H+}

uses
  Strings,
  JwaWbemCli,
  Windows;


{The window procedure for our hardcore API window}
function WindowProc(TheWindow: HWnd; TheMessage, WParam, LParam: longint): longint;
  stdcall;
begin
  case TheMessage of
    {upon getting the WM_DESTROY message, we exit the application}
    WM_DESTROY: begin
      PostQuitMessage(0);
      Exit;
    end;
  end;
  {call the default window procedure for all unhandled messages}
  Result := DefWindowProc(TheWindow, TheMessage, WParam, LParam);
end;

{Register the Window Class}
  function RegisterClass: boolean;
  var
    WindowClass: TWndClass;
  begin
    {setup our new window class}
    WindowClass.Style := CS_HREDRAW or CS_VREDRAW; {set the class styles}
    WindowClass.lpfnWndProc := @WindowProc; {point to the default
window procedure}
    WindowClass.cbClsExtra := 0; {no extra class memory}
    WindowClass.cbWndExtra := 0; {no extra window memory}
    WindowClass.hInstance := hInstance; {the application instance}
    WindowClass.hIcon := 0; {no icon specified}
    WindowClass.hCursor := 0; {no cursor specified}
    WindowClass.hbrBackground := COLOR_3DLIGHT; {use a predefined color}
    WindowClass.lpszMenuName := nil; {no menu}
    WindowClass.lpszClassName := 'TestClass'; {the registered class name}

    {now that we have our class set up, register it with the system}
    Result := Windows.RegisterClass(WindowClass) <> 0;
  end;



var
  TheMessage: TMsg;
  hWindow: HWND;
begin
  {Step 1: Register our new window class}
  if not RegisterClass then
  begin
    MessageBox(0,'RegisterClass failed', 'Error', MB_OK);
    Exit;
  end;

  {Step 2: Create a window based on our new class}
  hWindow := CreateWindowEx(0, {no extended styles}
    'TestClass', {the registered class name}
    'Mi Ventana', {the title bar text}
    WS_OVERLAPPEDWINDOW, {a normal window style}
    CW_USEDEFAULT, {default horizontal position}
    CW_USEDEFAULT, {default vertical position}
    CW_USEDEFAULT, {default width}
    CW_USEDEFAULT, {default height}
    0, {no owner window}
    0, {no menu}
    hInstance, {the application instance}
    nil {no additional information}
    );

  {Step 3: If our window was created successfully, display it}
  if hWindow <> 0 then
  begin
    ShowWindow(hWindow, SW_SHOWNORMAL);
    UpdateWindow(hWindow);
  end
  else
  begin
    MessageBox(0,'CreateWindow failed', 'Error', MB_OK);
    Exit;
  end;

  {the standard message loop}
  while GetMessage(TheMessage,0,0,0) do
  begin
    TranslateMessage(TheMessage);
    DispatchMessage(TheMessage);
  end;

end.

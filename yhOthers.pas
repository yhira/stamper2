unit yhOthers;

interface


uses
  Windows, SysUtils, Classes, Forms, StdCtrls;

	//Btnの中心にマウスカーソルを合わせる
  procedure SetMouseCursor(Btn: TButton);

implementation

procedure SetMouseCursor(Btn: TButton);
var
	P: TPoint;
begin
  P := Point(Btn.Width div 2, Btn.Height div 2);
  P := Btn.ClientToScreen(P);
  SetCursorPos(P.X, P.Y);
end;

end.

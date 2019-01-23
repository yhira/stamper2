unit ToolButtonEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ComCtrls;

type
  TToolButtonEx = class(TToolButton)
  private
    { Private �錾 } 
    FOnMouseLeave: TNotifyEvent;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    { Protected �錾 }
  public
    { Public �錾 }
  published
    { Published �錾 }
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('UserCompo', [TToolButtonEx]);
end;


{ TToolButtonLeave }

procedure TToolButtonEx.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

end.

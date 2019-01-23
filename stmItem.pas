unit stmItem;

interface

uses
  Windows, SysUtils, Classes, ComCtrls, yhFiles;

type

  TBaseItem = class
  private
    FIcon: Integer;
    FComment: string;
    FName: string;
    FCreateDay: TDateTime;
    procedure SetComment(const Value: string);
    procedure SetCreateDay(const Value: TDateTime);
    procedure SetIcon(const Value: Integer);
    procedure SetName(const Value: string);

  protected

  public
  	property Name: string read FName write SetName;
    property Icon: Integer read FIcon write SetIcon;
    property Comment: string read FComment write SetComment;
    property CreateDay: TDateTime read FCreateDay write SetCreateDay;
    constructor Create; virtual;
    procedure SaveStream(Stream: TFileStream); virtual;
    procedure LoadStream(Stream: TFileStream); virtual;
    procedure Encode; virtual;
    procedure Decode; virtual;
//    destructor Destroy; override;
  published

  end;

  TCategoryItem = class(TBaseItem)
  public
  	constructor Create; override;
  end;

  TFolderItem = class(TBaseItem)
  public
  	constructor Create; override;
  end;
                      
  TClipItem = class(TObject)
  private
    FName: ShortString;
    FData: string;
    FCreateDay: TDateTime;
    procedure SetName(const Value: ShortString);
    procedure SetCreateDay(const Value: TDateTime);
    procedure SetData(const Value: string);
  public
  	property Name: Shortstring read FName write SetName;
    property Data: string read FData write SetData;
    property CreateDay: TDateTime read FCreateDay write SetCreateDay;
  	constructor Create;       
    procedure Encode;
    procedure Decode;
  end;

  TPasteMode = (pmPaste, pmPasteTab, pmPasteEnter, pmPasteUp, pmPasteDown,
    pmPasteLeft, pmPasteRight, pmClip, pmBrowse, pmExecute);

  TPasteItem = class(TBaseItem)
  private
    FUseCount: Cardinal;
    FUpdateDay: TDateTime;
    FPasteMode: TPasteMode;
    FPasteData: string;
    procedure SetPasteMode(const Value: TPasteMode);
    procedure SetUpdateDay(const Value: TDateTime);
    procedure SetUseCount(const Value: Cardinal);
    procedure SetPasteData(const Value: string);

  protected

  public
    property UseCount: Cardinal read FUseCount write SetUseCount;
    property UpdateDay: TDateTime read FUpdateDay write SetUpdateDay;
    property PasteMode: TPasteMode read FPasteMode write SetPasteMode;
    property PasteData:  string read FPasteData write SetPasteData;
    constructor Create; override;
    procedure SaveStream(Stream: TFileStream); override;
    procedure LoadStream(Stream: TFileStream); override;  
    procedure Encode; override;
    procedure Decode; override;
//    destructor Destroy; override;
  published

  end;





implementation


{ TPasteItem }

constructor TPasteItem.Create;
begin
  inherited;
  FUseCount := 0;
  FUpdateDay := Now;
  FPasteMode := pmPaste;
  FIcon := 0;
  FName := '新規貼り付けデータ';
  FPasteData := '';
end;


procedure TPasteItem.Decode;
begin
  inherited;
  FPasteData := Encryption(FPasteData, True);
end;

procedure TPasteItem.Encode;
begin
  inherited;
  FPasteData := Encryption(FPasteData, False);
end;

procedure TPasteItem.LoadStream(Stream: TFileStream);
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  inherited LoadStream(Stream);

  with Stream do begin
    //使用回数
    Read(len, SizeOf(Len));
    Self.UseCount := Len;
    //更新日
    Read(Day, SizeOf(Day));
    Self.UpdateDay := Day;
    //モード
    Read(len, SizeOf(Len));
    Self.PasteMode := TPasteMode(Len);
    //貼り付けデータ
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Self.PasteData := s;
  end;
end;

procedure TPasteItem.SaveStream(Stream: TFileStream);
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
	inherited SaveStream(Stream);

  with Stream do begin
//  	//名前
//    s := Self.Name;
//    len := Length(s);
//    Write(len, SizeOf(len));
//    Write(PChar(s)^, len);
//    //コメント
//    s := Self.Comment;
//    len := Length(s);
//    Write(len, SizeOf(len));
//    Write(PChar(s)^, len);
//     //アイコン
//    len := Self.Icon;
//    Write(len, SizeOf(len));
//    //作成日
//    day := Self.CreateDay;
//    Write(day, SizeOf(day));
    //使用回数
    len := Self.UseCount;
    Write(len, SizeOf(len));
    //更新日
    day := Self.UpdateDay;
    Write(day, SizeOf(day));
    //モード
    len := Ord(Self.FPasteMode);
    Write(len, SizeOf(len));
    //貼り付けデータ
    s := Self.PasteData;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);

  end;
end;

procedure TPasteItem.SetPasteData(const Value: string);
begin
  FPasteData := Value;
end;

procedure TPasteItem.SetPasteMode(const Value: TPasteMode);
begin
  FPasteMode := Value;
end;

procedure TPasteItem.SetUpdateDay(const Value: TDateTime);
begin
  FUpdateDay := Value;
end;

procedure TPasteItem.SetUseCount(const Value: Cardinal);
begin
  FUseCount := Value;
end;

{ TBaseItem }

constructor TBaseItem.Create;
begin
	FName := '';
  FIcon := 0;
  FComment := '';               
  FCreateDay := Now;
end;


procedure TBaseItem.Decode;
begin
	FName := Encryption(FName, True);
  FComment := Encryption(FComment, True);
end;

procedure TBaseItem.Encode;
begin
  FName := Encryption(FName, False); 
  FComment := Encryption(FComment, False);
end;

procedure TBaseItem.LoadStream(Stream: TFileStream);
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  with Stream do
  begin
    //名前
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Self.Name := s;
    //TFolderItem(Node.Data).Name := s;
    //コメント
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Self.Comment := s;
    //アイコン
    read(len, SizeOf(len));
    Self.Icon := len;
    //作成日
    Read(Day, SizeOf(Day));
    Self.CreateDay := Day;
  end;

end;

procedure TBaseItem.SaveStream(Stream: TFileStream);
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  with Stream do begin
  	//名前
    s := Self.Name;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
    //コメント
    s := Self.Comment;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
     //アイコン
    len := Self.Icon;
    Write(len, SizeOf(len));
    //作成日
    day := Self.CreateDay;
    Write(day, SizeOf(day));

  end;
end;

procedure TBaseItem.SetComment(const Value: string);
begin
  FComment := Value;
end;

procedure TBaseItem.SetCreateDay(const Value: TDateTime);
begin
  FCreateDay := Value;
end;

procedure TBaseItem.SetIcon(const Value: Integer);
begin
  FIcon := Value;
end;

procedure TBaseItem.SetName(const Value: string);
begin
  FName := Value;
end;

{ TCategoryItem }

constructor TCategoryItem.Create;
begin
  inherited;
	FName := '新規カテゴリ';
end;

{ TFolderItem }

constructor TFolderItem.Create;
begin
  inherited;
  FName := '新規フォルダ';
end;

{ TClipItem }

constructor TClipItem.Create;
begin
  inherited;
  FName := '';
  FData := '';
  FCreateDay := Now;
end;

procedure TClipItem.Decode;
begin
	FName := Encryption(FName, True);
  FData := Encryption(FData, True);
end;

procedure TClipItem.Encode;
begin                 
	FName := Encryption(FName, False);
  FData := Encryption(FData, False);
end;

procedure TClipItem.SetCreateDay(const Value: TDateTime);
begin
  FCreateDay := Value;
end;

procedure TClipItem.SetData(const Value: string);
begin
  FData := Value;
end;

procedure TClipItem.SetName(const Value: ShortString);
begin
  FName := Value;
end;

end.

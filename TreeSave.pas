unit TreeSave;

interface

uses
  Classes;

type
  TSaveThread = class(TThread)
  private
    { Private 宣言 }
  protected
    procedure Execute; override;
  end;

implementation

{注意: 
  異なるスレッドが所有する VCL または CLX のメソッド/関数/
  プロパティを別のスレッドの中から扱う場合、排他処理の問題が
  発生します。

  メインスレッドの所有するオブジェクトに対しては Synchronize
  メソッドを使う事ができます。他のオブジェクトを参照するため
  のメソッドをスレッドクラスに追加し、Synchronize メソッドの
  引数として渡します。

  たとえば、UpdateCaption メソッドを以下のように定義し、

    procedure TSaveThread.UpdateCaption;
    begin
      Form1.Caption := 'TSaveThread スレッドから書き換えました';
    end;

  Execute メソッドの中で Synchronize メソッドに渡すことでメイ
  ンスレッドが所有する Form1 の Caption プロパティを安全に変
  更できます。

      Synchronize(UpdateCaption);
}

{ TSaveThread }

procedure TSaveThread.Execute;
begin
  { ToDo : スレッドとして実行したいコードをこの下に記述してください }  
end;

end.

unit TreeSave;

interface

uses
  Classes;

type
  TSaveThread = class(TThread)
  private
    { Private �錾 }
  protected
    procedure Execute; override;
  end;

implementation

{����: 
  �قȂ�X���b�h�����L���� VCL �܂��� CLX �̃��\�b�h/�֐�/
  �v���p�e�B��ʂ̃X���b�h�̒����爵���ꍇ�A�r�������̖�肪
  �������܂��B

  ���C���X���b�h�̏��L����I�u�W�F�N�g�ɑ΂��Ă� Synchronize
  ���\�b�h���g�������ł��܂��B���̃I�u�W�F�N�g���Q�Ƃ��邽��
  �̃��\�b�h���X���b�h�N���X�ɒǉ����ASynchronize ���\�b�h��
  �����Ƃ��ēn���܂��B

  ���Ƃ��΁AUpdateCaption ���\�b�h���ȉ��̂悤�ɒ�`���A

    procedure TSaveThread.UpdateCaption;
    begin
      Form1.Caption := 'TSaveThread �X���b�h���珑�������܂���';
    end;

  Execute ���\�b�h�̒��� Synchronize ���\�b�h�ɓn�����ƂŃ��C
  ���X���b�h�����L���� Form1 �� Caption �v���p�e�B�����S�ɕ�
  �X�ł��܂��B

      Synchronize(UpdateCaption);
}

{ TSaveThread }

procedure TSaveThread.Execute;
begin
  { ToDo : �X���b�h�Ƃ��Ď��s�������R�[�h�����̉��ɋL�q���Ă������� }  
end;

end.

unit uConfiguraListaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit, RzLabel, RzPanel,
  RzButton, RzRadChk;

type
  TConfiguraListaClientes = class(TForm)
    gbSem: TRzGroupBox;
    clrFundoSem: TRzColorEdit;
    clrFonteSem: TRzColorEdit;
    gbNovos: TRzGroupBox;
    clrFundoNovos: TRzColorEdit;
    clrFonteNovos: TRzColorEdit;
    gbGeral: TRzGroupBox;
    clrFundoGeral: TRzColorEdit;
    clrFonteGeral: TRzColorEdit;
    Panel1: TPanel;
    bbAtualizar: TBitBtn;
    bbCancelar: TBitBtn;
    chkGeral: TRzCheckBox;
    chkSem: TRzCheckBox;
    chkNovos: TRzCheckBox;
    chkFundoSem: TRzLabel;
    chkFonteSem: TRzLabel;
    chkFundoNovos: TRzLabel;
    chkFonteNovos: TRzLabel;
    chkFundoGeral: TRzLabel;
    chkFonteGeral: TRzLabel;
    edtGeral: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edtSem: TRzEdit;
    RzLabel3: TRzLabel;
    edtNovos: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbAtualizarClick(Sender: TObject);
    procedure chkGeralClick(Sender: TObject);
  private
    procedure ChecaCores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfiguraListaClientes: TConfiguraListaClientes;

implementation

uses Registry, Math;

{$R *.dfm}

procedure TConfiguraListaClientes.FormCreate(Sender: TObject);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_READ);
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\MSystem\ListaClientes', False) then
    begin
      chkNovos.Checked := reg.ValueExists('clrFonteNovos');
      chkGeral.Checked := reg.ValueExists('clrFonteGeral');
      chkSem.Checked   := reg.ValueExists('clrFonteSem');

      if chkGeral.Checked then
      begin
        clrFonteGeral.SelectedColor := reg.ReadInteger('clrFonteGeral');
        clrFundoGeral.SelectedColor := reg.ReadInteger('clrFundoGeral');
      end;

      if chkNovos.Checked then
      begin
        clrFonteNovos.SelectedColor := reg.ReadInteger('clrFonteNovos');
        clrFundoNovos.SelectedColor := reg.ReadInteger('clrFundoNovos');
      end;

      if chkSem.Checked then
      begin
        clrFonteSem.SelectedColor := reg.ReadInteger('clrFonteSem');
        clrFundoSem.SelectedColor := reg.ReadInteger('clrFundoSem');
      end;
      ChecaCores; 
    end;
  finally
    reg.Free;
  end;
end;

procedure TConfiguraListaClientes.bbAtualizarClick(Sender: TObject);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_WRITE);
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.DeleteKey('\Software\MSystem\ListaClientes');
    if reg.OpenKey('\Software\MSystem\ListaClientes', True) then
    begin
      if chkGeral.Checked then
      begin
        reg.WriteInteger('clrFonteGeral', clrFonteGeral.SelectedColor);
        reg.WriteInteger('clrFundoGeral', clrFundoGeral.SelectedColor);
      end;

      if chkNovos.Checked then
      begin
        reg.WriteInteger('clrFonteNovos', clrFonteNovos.SelectedColor);
        reg.WriteInteger('clrFundoNovos', clrFundoNovos.SelectedColor);
      end;

      if chkSem.Checked then
      begin
        reg.WriteInteger('clrFonteSem', clrFonteSem.SelectedColor);
        reg.WriteInteger('clrFundoSem', clrFundoSem.SelectedColor);
      end;
    end;
  finally
    reg.Free;
  end;
end;

procedure TConfiguraListaClientes.ChecaCores;
begin
  gbGeral.Enabled := chkGeral.Checked;
  edtGeral.Brush.Color := clrFundoGeral.SelectedColor;
  edtGeral.Font.Color  := clrFonteGeral.SelectedColor;
  edtGeral.Repaint;

  gbSem.Enabled   := chkSem.Checked;
  edtSem.Brush.Color := clrFundoSem.SelectedColor;
  edtSem.Font.Color  := clrFonteSem.SelectedColor;
  edtSem.Repaint;

  gbNovos.Enabled := chkNovos.Checked;
  edtNovos.Brush.Color := clrFundoNovos.SelectedColor;
  edtNovos.Font.Color  := clrFonteNovos.SelectedColor;
  edtNovos.Repaint;
end;

procedure TConfiguraListaClientes.chkGeralClick(Sender: TObject);
begin
  ChecaCores;
end;

end.


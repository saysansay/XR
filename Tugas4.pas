unit hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.Hash;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    txtSalt: TEdit;
    txtHash: TEdit;
    Label2: TLabel;
    txtVerify: TEdit;
    Label3: TLabel;
    txtPwd: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    FSalt :string;
    function GetSalt(): String;
    function GetStrHashSHA256(Str,Salt: String): String;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if  txtPwd.Text='' then
  begin
    MessageDlg('Masukan password yang akan dihash!',TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0);
    txtPwd.SetFocus;
    Abort;
  end;
  FSalt := GetSalt;
  txtSalt.Text := FSalt;
  txtHash.Text := GetStrHashSHA256(txtPwd.Text,FSalt);
end;

procedure TForm1.Button2Click(Sender: TObject);
var Retval :string;
begin
  if  txtVerify.Text='' then
  begin
    MessageDlg('Masukan Verify password yang akan dihash!',TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0);
    txtPwd.SetFocus;
    Abort;
  end;
  Retval :=GetStrHashSHA256(txtVerify.Text,FSalt);

  if (txtHash.Text=Retval) then
      MessageDlg('True',TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0)
  else
     MessageDlg('False',TMsgDlgType.mtInformation,[TMsgDlgBtn.mbOK],0)

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

function TForm1.GetSalt: String;
var
  SaltMD5: THashMD5;
begin
  SaltMD5 := THashMD5.Create;
  //HashMD5.GetHashString(DateToStr(Now));
  result := SaltMD5.GetHashString(DateToStr(Now));
end;

function TForm1.GetStrHashSHA256(Str, Salt: String): String;
var
  HashSHA: THashSHA2;
  RetVal :string ;
begin
    HashSHA := THashSHA2.Create;
    RetVal:=HashSHA.GetHashString(Str+Salt);
    result := HashSHA.GetHashString(RetVal);
end;


end.

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    btnCal: TButton;
    btnExit: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtYear: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edtGregorian: TEdit;
    Label3: TLabel;
    edtOthodox: TEdit;
    procedure btnExitClick(Sender: TObject);
    procedure btnCalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.btnCalClick(Sender: TObject);
var
  year, month, day, julian: Integer;
  a, b, c, d, e, g, h, i, k, l, m: Integer;

begin
  try
    year:= StrToInt(edtYear.Text);
  except on EConvertError do
    begin
      ShowMessage('Please enter a valid year to calculate the Easter dates!');
      edtYear.SetFocus;
      edtYear.SelectAll;
      Exit;
    end;
  end;
  if year < 325 then
    begin
      edtGregorian.Text:='Error';
      edtOthodox.Text:= edtGregorian.Text;
      edtYear.SetFocus;
      edtYear.SelectAll;
      ShowMessage('The year provided is before the Council of Nicaea!');
      Exit;
    end;
  if year < 1583 then
    begin
      a:= year mod 4;
      b:= year mod 7;
      c:= year mod 19;
      d:= (19*c + 15) mod 30;
      e:= (2*a+4*b-d+34) mod 7;
      month:= (d + e + 114) div 31;
      day:= 1 + (d + e + 114) mod 31;
      edtGregorian.Text:= DateToStr(EncodeDate(year,month,day));
      edtOthodox.Text:= edtGregorian.Text;
      edtYear.SetFocus;
      edtYear.SelectAll;
    end
  else
    begin
      //Western Easter
      a:= year mod 19; // year in the 19 solar years cycle
      b:= year div 100; //century
      c:= year mod 100; //year of the century
      d:= b div 4;
      e:= b mod 4; //determines if the century has the last year as leap year (e=0)
      i:= c div 4; //the leap year cycle in the century
      k:= c mod 4; //determines if the year is a leap year (k=0)
      g:= (8*b + 13) div 25;
      h:= (19*a + b - d - g + 15) mod 30;
      l:= (32 + 2*e + 2*i - h - k) mod 7;
      m:= (a + 11*h + 19*l) div 433;
      month:= (h + l - 7*m + 90) div 25;
      day:= (h + l - 7*m + 33*month + 19) mod 32;
      edtGregorian.Text:= DateToStr(EncodeDate(year,month,day));
      //Eastern Easter
      a:= year mod 4;
      b:= year mod 7;
      c:= year mod 19;
      d:= (19*c + 15) mod 30;
      e:= (2*a+4*b-d+34) mod 7;
      //century := year div 100;
      julian:= (3*(year div 400) + (year div 100) mod 4) - 2;
      //ShowMessage(IntToStr(julian));
      month:= (d + e + 114) div 31;
      day:= 1 + (d + e + 114) mod 31;
      edtOthodox.Text:= DateToStr(EncodeDate(year,month,day)+julian);
      edtYear.SetFocus;
      edtYear.SelectAll;
    end;
  end;

procedure TForm1.FormShow(Sender: TObject);
begin
  edtYear.SetFocus;
  edtYear.SelectAll;
end;

end.

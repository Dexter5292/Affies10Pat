unit mm_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Buttons,math;

type
  TMasterMind = class(TForm)
    Image7: TImage;
    pgcIntro: TPageControl;
    tsIntro: TTabSheet;
    img1: TImage;
    lbl1: TLabel;
    img2: TImage;
    lbl2: TLabel;
    edtName: TEdit;
    tsGame: TTabSheet;
    img3: TImage;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    shp4: TShape;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnlChances: TPanel;
    btnFinished: TButton;
    redGuess: TRichEdit;
    tsGameOver: TTabSheet;
    Image1: TImage;
    bmbClose: TBitBtn;
    bmbRetry: TBitBtn;
    tsWin: TTabSheet;
    Image2: TImage;
    BitBtn1: TBitBtn;
    bmbReplay: TBitBtn;
    tsInstructionns: TTabSheet;
    Image3: TImage;
    lbl3: TLabel;
    shpInst: TShape;
    shpInst2: TShape;
    lbl4: TLabel;
    btnN: TButton;
    btnY: TButton;
    btnNext: TButton;
    btnTry: TButton;
    shp6: TShape;
    Label1: TLabel;
    procedure img2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnl1Click(Sender: TObject);
    procedure pnl2Click(Sender: TObject);
    procedure pnl3Click(Sender: TObject);
    procedure pnl4Click(Sender: TObject);
    procedure btnFinishedClick(Sender: TObject);
    procedure bmbReplayClick(Sender: TObject);
    procedure bmbRetryClick(Sender: TObject);
    procedure btnYClick(Sender: TObject);
    procedure btnNClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnTryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MasterMind: TMasterMind;
  Name : String;
   Instruction : boolean  ;
	  Num1 : string;
	  Num2 : string;
	  Num3 : string;
	  num4 : string;
    S : string;
	  Answer1 : string;
	  Answer2 : string;
	  Answer3 : string;
	  Answer4 : string;
	  valid : boolean  ;
	  FullNum : string ;
	  FullAnswer : string;
	  Chances : Integer;
    value : integer;
implementation

{$R *.dfm}

procedure TMasterMind.bmbReplayClick(Sender: TObject);
begin
  FullNum := '';
  FullAnswer := '';
  edtName.Clear;
  pgcIntro.Pages[0].Show;
  shp1.Visible := false;
  shp2.Visible := false;
  shp3.Visible := false;
  shp4.Visible := false;
  redGuess.Lines.Clear;
end;

procedure TMasterMind.bmbRetryClick(Sender: TObject);
begin
   FullNum := '';
  FullAnswer := '';
  edtName.Clear;
  pgcIntro.Pages[0].Show;
  shp1.Visible := false;
  shp2.Visible := false;
  shp3.Visible := false;
  shp4.Visible := false;
  redGuess.Lines.Clear;
end;

procedure TMasterMind.btnFinishedClick(Sender: TObject);
var
    Color : String;
    s :string;

begin
    shp1.Visible := true;
    shp1.Brush.Color := clBlack;
    shp2.Visible := true;
    shp2.Brush.Color := clBlack;
    shp3.Visible := true;
    shp3.Brush.Color := clBlack;
    shp4.Visible := true;
    shp4.Brush.Color := clBlack;
    fullNum := Num1+Num2+Num3+Num4;
    redGuess.Lines.Add(FullNum);
    pnl1.Enabled := true;
    pnl2.Enabled := true;
    pnl3.Enabled := true;
    pnl4.Enabled := true;
    redGuess.Lines.Add(' ');

    Color := '';
    S := Copy(fullAnswer,1,4);
    if chances = 1 then
      begin
        pgcIntro.Pages[2].Show;
      end;
  if valid = false then
    begin
      ShowMessage('You have not entered a correct numer, please try again');
      pnl1.Caption := 'Number 1';
      pnl2.Caption := 'Number 2';
      pnl3.Caption := 'Number 3';
      pnl4.Caption := 'Number 4';
      Chances := Chances;
      FullNum := '';
      valid := true;
    end else
     if valid then
       begin
          Chances := Chances -1 ;
          pnlChances.Caption := IntToStr(Chances);



               if FullAnswer= FullNum then
               begin
                 shp1.Visible := true;
                 shp2.Visible := true;
                 shp3.Visible := true;
                 shp4.Visible := true;
                 shp1.Brush.Color := clRed;
                 shp2.Brush.Color := clRed;
                 shp3.Brush.Color := clRed;
                 shp4.Brush.Color := clRed;
                 pgcIntro.Pages[3].Show;
                 showmessage('Well done '+ Name+ ',you solved it in '+ IntToStr(10-Chances)+ ' chances');
               end else
               begin


                     if FullNum[1]=S[1] then
                        begin
                          shp1.Brush.Color := clRed;
                          Color := color + 'red';
                        end else
                          if FullNum[1]= S[2] then
                                begin
                                  shp1.Brush.Color := clWhite;
                                  Color := color + 'white';
                                 end else
                                   if FullNum[1]=S[3] then
                                   begin
                                      shp1.Brush.Color := clWhite;
                                       Color := color + 'white';
                                   end else
                                     if FullNum[1]=S[4] then
                                      begin
                                         shp1.Brush.Color := clWhite;
                                          Color := color + 'white';
                                      end;



                    if Fullnum[2]=S[2] then
                        begin
                          shp3.Brush.Color := clRed;
                          Color := color + ',red';
                          end else
                          if Fullnum[2]=S[1] then
                                 begin
                                  shp3.Brush.Color := clWhite;
                                   Color := color + ',white';
                                 end else
                                   if FullNum[2]=S[3] then
                                   begin
                                       shp3.Brush.Color := clWhite;
                                        Color := color + ',white';
                                   end else
                                     if FullNum[2]=S[4] then
                                       begin
                                          shp3.Brush.Color := clWhite;
                                           Color := color + ',white';
                                       end;



                    if FullNum[3]= S[3] then
                        begin
                          shp2.Brush.Color := clred;
                          Color := color + ',red';
                        end else if FullNum[3]=S[1] then
                                 begin
                                   shp2.Brush.Color := clWhite;
                                    Color := color + ',white';
                                 end else
                                   if FullNum[3]= S[2] then
                                   begin
                                     shp2.Brush.Color := clWhite;
                                      Color := color + ',white';
                                   end else
                                     if FullNum[3]= S[4] then
                                       begin
                                          shp2.Brush.Color := clWhite;
                                           Color := color + ',white';
                                       end;


                   if FullNum[4]=S[4] then
                        begin
                          shp4.Brush.Color := clred;
                          Color := color + ',red';
                        end else
                          if fullNum[4]=s[1]  then
                                begin
                                  shp4.Brush.Color := clWhite;
                                   Color := color + ',white';
                            end else
                              if FullNum[4]= S[2]  then
                              begin
                                shp4.Brush.Color := clWhite;
                                 Color := color + ',white';
                              end else
                                if FullNum[4]= S[3] then
                                begin
                                  shp4.Brush.Color := clWhite;
                                   Color := color + ',white';
                                end;


                   redGuess.Lines.Add(Color);
                    redGuess.Lines.Add('');

                 end;




       end ;








    pnl1.Caption := 'Number 1';
    pnl2.Caption := 'Number 2';
    pnl3.Caption := 'Number 3';
    pnl4.Caption := 'Number 4';
    FullNum := '';

end;

procedure TMasterMind.btnNClick(Sender: TObject);
begin
  lbl3.Caption:= 'Mastermind is about guessing a pattern of numbers as fast as possible';
  btnY.Visible := False;
  btnN.Visible := False;
  btnNext.visible := true;
end;

procedure TMasterMind.btnNextClick(Sender: TObject);
begin
  shpInst.Visible := true;
  shpInst2.Visible:= true;
  shpInst2.Brush.Color := clRed;
  lbl4.Visible:= true;
  label1.Visible := true;
  shp6.Visible := true;
  lbl3.Caption := 'A white dot means that you have guessed the right number,but it''s not in the right position(The dots are randomly selected)';
  btnNext.Visible := false;
  btnTry.Visible := true;
end;

procedure TMasterMind.btnTryClick(Sender: TObject);
begin
  pgcIntro.Pages[0].Show;
  redGuess.Lines.Add('Click on ''Number1''');
  redGuess.Lines.Add('click on ''Number2''');
  redGuess.Lines.Add('Click on ''Number3''');
  redGuess.Lines.Add('Click on ''Number4''');
  redGuess.Lines.Add('After that , click ''Check''');
end;
procedure TMasterMind.btnYClick(Sender: TObject);
begin
  pgcIntro.Pages[0].show;
end;

procedure TMasterMind.FormCreate(Sender: TObject);
begin
 pgcIntro.Pages[4].Show;
 btnNext.Visible := false;
 end;

procedure TMasterMind.img2Click(Sender: TObject);
begin
   Name := edtName.Text;
   pgcIntro.Pages[1].Show;
   Chances := 10;
   pnlChances.caption := '10';
   Answer1 := IntToStr(RandomRange (0,7));
   Answer2 := IntToStr(RandomRange (0,7));
   Answer3 := IntToStr(RandomRange (0,7));
   Answer4 := IntToStr(RandomRange (0,7));
   FullAnswer := Answer1 + Answer2 + Answer3 + Answer4 ;
   S := Copy(FullAnswer,1,4);
   Instruction := False;
   FullNum := '';
   valid := True;
   shp1.Visible := false;
   shp2.Visible := false;
   shp3.Visible := false;
   shp4.Visible := false;
end;

procedure TMasterMind.pnl1Click(Sender: TObject);
begin
  Num1 := InputBox('Number1','Enter a number form 0 to 6 :','0');
     if not TryStrToInt(Num1,value)    then
    begin
       valid := false;
    end else
     if  frac(StrToInt(Num1))<>0 then
       begin
       valid := false;
       end else
        if StrToInt(Num1) > 6  then
         begin
           valid := false;
         end ;
  pnl1.Enabled := false;
  pnl1.Caption:= Num1;


end;

procedure TMasterMind.pnl2Click(Sender: TObject);
begin
  Num2 := InputBox('Number2','Enter a number form 0 to 6 :','0');
    if not TryStrToInt(Num2,value)    then
    begin
       valid := false;
    end else
      if  frac(StrToInt(Num2))<>0 then
       begin
         valid := false;
       end else
        if StrToInt(Num2) > 6  then
         begin
           valid := false;
         end ;
         pnl2.Enabled := false;
  pnl2.Caption:= Num2;
end;

procedure TMasterMind.pnl3Click(Sender: TObject);
begin
  Num3 := InputBox('Number3','Enter a number form 0 to 6 :','0');
    if not TryStrToInt(Num3,value)    then
      begin
        valid := false;
      end else
       if  frac(StrToInt(Num3))<>0 then
         begin
           valid := false;
         end else
           if StrToInt(Num3) > 6  then
             begin
               valid := false;
             end ;
             pnl3.Enabled:= false;
  pnl3.Caption:= Num3;
end;

procedure TMasterMind.pnl4Click(Sender: TObject);
begin
  Num4 := InputBox('Number4','Enter a number form 0 to 6 :','0');
    if not TryStrToInt(Num4,value)    then
    begin
       valid := false;
    end else
      if  frac(StrToInt(Num4))<>0 then
        begin
          valid := false;
        end else
          if StrToInt(Num4) > 6  then
            begin
              valid := false;
            end ;
  pnl4.Enabled:= false;
  pnl4.Caption:= Num4;
end;



end.

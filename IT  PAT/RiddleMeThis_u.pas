unit RiddleMeThis_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, math;

type
  TForm1 = class(TForm)
    tpage: TPageControl;
    MainMenu: TTabSheet;
    BtnInstructions: TButton;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    Action1: TAction;
    FileExit1: TFileExit;
    Label1: TLabel;
    Instructions: TTabSheet;
    BtnStart: TButton;
    Label2: TLabel;
    Start: TTabSheet;
    Redinstructions: TRichEdit;
    Button1: TButton;
    DialogColorSelect1: TColorSelect;
    Exit1: TMenuItem;
    btnObjective: TButton;
    Label3: TLabel;
    Objectives: TTabSheet;
    redobjective: TRichEdit;
    btninstructions2: TButton;
    Label4: TLabel;
    btnPlayer1: TButton;
    btnPlayer2: TButton;
    Singleplayer: TTabSheet;
    edtPlayer1: TEdit;
    Label5: TLabel;
    btnDone: TButton;
    Singleboard: TTabSheet;
    pnlStart: TPanel;
    pnlBlock1: TPanel;
    pnlBlock2: TPanel;
    pnlblock3: TPanel;
    pnlBlock4: TPanel;
    pnlBlock5: TPanel;
    pnlBlock6: TPanel;
    pnlBlock7: TPanel;
    pnlBlock8: TPanel;
    pnlBlock9: TPanel;
    pnlBlock10: TPanel;
    pnlBlock11: TPanel;
    pnlBlock12: TPanel;
    pnlBlock13: TPanel;
    pnlBlock14: TPanel;
    pnlBlock15: TPanel;
    pnlBlock16: TPanel;
    pnlBlock17: TPanel;
    pnlBlock18: TPanel;
    pnlEnd: TPanel;
    Image1: TImage;
    btnbegin: TButton;
    btnroll: TButton;
    edtPlayer2: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    pnlDice: TPanel;
    rgAnswers: TRadioGroup;
    Ttimer1: TTimer;
    lblTimer: TLabel;
    RedQuestion: TRichEdit;
    shplayer1: TShape;
    shplayer2: TShape;
    btnRoll2: TButton;
    procedure BtnInstructionsClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure btnObjectiveClick(Sender: TObject);
    procedure btninstructions2Click(Sender: TObject);
    procedure BtnMultiplayerClick(Sender: TObject);
    procedure btnSingleplayerClick(Sender: TObject);
    procedure btnPlayer1Click(Sender: TObject);
    procedure btnDoneClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SingleboardShow(Sender: TObject);
    procedure btnrollClick(Sender: TObject);
    procedure btnPlayer2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ttimer1Timer(Sender: TObject);
    procedure rgAnswersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  player1, player2, player3, player4 : string;
  dice : array[1..6] of integer;
  icount : integer;
  Timeleft : integer;
  started : boolean;
  choice : integer;
  points : integer;
  icount2 : integer;
  Vfile : textfile;
  vline : string;
  answer : string;
  answers : array[0..30] of string;
  question : string;
  vline2   : string;
  vplayercount : integer;
  vdice     : integer;
  vdice2    : integer;

  boardice1,boardice2 : integer;

implementation

{$R *.dfm}

procedure TForm1.btnDoneClick(Sender: TObject);
begin
   btnroll2.enabled := false;
   redquestion.enabled := false;
   rganswers.enabled := false;
   btnbegin.Enabled := false;
  tpage.ActivePage := singleboard;

end;

procedure TForm1.btninstructions2Click(Sender: TObject);


begin
  tpage.ActivePage := Instructions;
  assignfile(vfile,'instructions.txt');
  reset(vfile);
  redinstructions.Lines.Clear;
  while not EOF(vfile) do
    begin
      readln(vfile,vline);
      redinstructions.Lines.Add(vline);
    end
end;

procedure TForm1.BtnInstructionsClick(Sender: TObject);


begin
  tpage.ActivePage := Instructions;
  assignfile(vfile,'instructions.txt');
  reset(vfile);
  redinstructions.Lines.Clear;
  while not EOF(vfile) do
    begin
      readln(vfile,vline);
      redinstructions.Lines.Add(vline);
    end;






end;

procedure TForm1.BtnMultiplayerClick(Sender: TObject);
begin
 // tpage.ActivePage := ;
end;

procedure TForm1.btnObjectiveClick(Sender: TObject);

begin
  tpage.ActivePage := objectives;
  assignfile(vfile,'objective.txt');
  reset(vfile);
  redobjective.Lines.clear;
  while not EOF(vfile) do
    begin
      readln(vfile,vline);
      redobjective.Lines.Add(vline);
    end;
end;

procedure TForm1.btnSingleplayerClick(Sender: TObject);
begin
  tpage.ActivePage := singleplayer;
end;

procedure TForm1.BtnStartClick(Sender: TObject);
begin
  tpage.ActivePage := start;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  tpage.ActivePage := start;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  vplayercount := 0;

  tpage.ActivePage := mainmenu;

  boardice1 := 0;
  boardice2 := 0;

  timeleft := 60;
  started := false;
  lblTimer.Caption := 'press start to start';
end;

procedure TForm1.rgAnswersClick(Sender: TObject);
var
  answers : string;
begin
 if rganswers.ItemIndex = choice then
   begin
     showmessage('correct');
     rganswers.items.clear;
     redquestion.Lines.Clear;
     boardice1 := boardice1 + vdice;
     boardice2 := boardice2 + vdice2;
     started := false;
   end else
   begin
     showmessage('Incorrect');
     rganswers.Items.Clear;
     redquestion.Lines.Clear;
     boardice1 := boardice1;
     boardice2 := boardice2;
     started := false;
   end;
end;

procedure TForm1.SingleboardShow(Sender: TObject);
begin
  showmessage('press the roll button to see who goes first');
end;

procedure TForm1.Ttimer1Timer(Sender: TObject);
begin
  if started then
  begin
    timeleft := timeleft - 1;
  if timeleft <> 0 then
    begin
      lbltimer.Caption := 'you have ' + inttostr(timeleft) + 'seconds left';
    end else
    begin
      started := false;
      lbltimer.Caption := 'Times up ';

    end;
  end;
end;

procedure TForm1.btnPlayer1Click(Sender: TObject);
begin
  tpage.ActivePage := singleplayer;
  edtplayer1.Enabled := true;
  edtplayer2.Enabled := false;
end;

procedure TForm1.btnPlayer2Click(Sender: TObject);
begin
  tpage.ActivePage := singleplayer;
  edtplayer1.Enabled := true;
  edtplayer2.Enabled := true;
end;

procedure TForm1.btnrollClick(Sender: TObject);
var
  I: Integer;
  ipos : integer;
  x: Integer;
  vfile2 : textfile;
  vplayerdice1 : integer;
  vplayerdice2: integer;
begin


  vplayercount := vplayercount + 1;

  showmessage(inttostr(vplayercount));

  player1 := edtplayer1.Text;
  player2 := edtplayer2.Text;

  vplayerdice1 := randomrange(1,6);
  vplayerdice2 := randomrange(1,6);

   vdice := randomrange(1,3);
  vdice2 := randomrange(1,3);


  if vplayercount = 2 then
   begin
      btnroll2.enabled := true;
      redquestion.enabled := true;
      rganswers.enabled := true;
      btnbegin.Enabled := true;

    Started := true;
    timeleft := 30;

    assignfile(vfile, 'Questions.txt');
    reset(vfile);

    for I := 1 to randomrange(1,16) do
     begin
     readln(vfile,vline);
     ipos := pos('#',vline);
     question := copy(vline,1,ipos -1);
     answer := copy(vline,ipos + 1,length(vline) - ipos);
     end;

    assignfile(vfile2,'Questions2.txt');
    reset(vfile2);
   for x := 1 to 16 do
     begin
      readln(vfile2,vline);
      answers[X] := vline;
     end;

     rganswers.Items.Add(answers[randomrange(1,16)]);
     rganswers.Items.Add(answers[randomrange(1,16)]);
     rganswers.Items.Add(answers[randomrange(1,16)]);
     rganswers.Items.Add(answers[randomrange(1,16)]);

     choice := randomrange(1,4);

     rganswers.Items[choice] := answer;

     redquestion.Lines.Add(question);
 //====================================================================================
     if vplayerdice1 > vplayerdice2 then
       begin
         showmessage(player1 + ' is first');
         vplayercount := 0;
       end else
       begin
         showmessage(player2 + ' is first');
         vplayercount := 0;
       end;
      if vplayercount = 0 then
      begin

      if vplayerdice1 > vplayerdice2 then
         begin

          boardice1 := boardice1 + vdice;

           if boardice1 = 1  then
             begin

               shplayer1.Parent := pnlblock1;

             end else if boardice1 = 2 then
             begin

               shplayer1.Parent := pnlblock2;

             end else if boardice1 = 3 then
             begin

               shplayer1.Parent := pnlblock3;

             end else if boardice1 = 4 then
             begin

               shplayer1.Parent := pnlblock4;

             end else if boardice1 = 5 then
             begin

               shplayer1.Parent := pnlblock5;

             end else if boardice1 = 6 then
             begin

               shplayer1.parent := pnlblock6;

             end else if boardice1 = 7 then
             begin

               shplayer1.Parent := pnlblock7;

             end else if boardice1 = 8 then
             begin

               shplayer1.Parent := pnlblock8;

             end else if boardice1 = 9 then
             begin

               shplayer1.Parent := pnlblock9;

             end else if boardice1 = 10 then
             begin

               shplayer1.Parent := pnlblock10;

             end else if boardice1 = 11 then
             begin

               shplayer1.parent := pnlblock11;

             end else if boardice1 = 12 then
             begin

               shplayer1.Parent := pnlblock12;

             end else if boardice1 = 13 then
             begin

               shplayer1.Parent := pnlblock13;

             end else if boardice1 = 14 then
             begin

               shplayer1.Parent := pnlblock14;

             end else if boardice1 = 15 then
             begin

               shplayer1.Parent := pnlblock15;

             end else if boardice1 = 16 then
             begin

               shplayer1.parent := pnlblock16;

             end else if boardice1 = 17 then
             begin

               shplayer1.Parent := pnlblock17;

             end else if boardice1 = 18 then
             begin

               shplayer1.Parent := pnlblock18;

             end else if boardice1 = 19 then
             begin

               shplayer1.Parent := pnlend;

             end;


         end else
         begin

           boardice2 := boardice2 + vdice2;

            if boardice2 = 1 then
              begin

                shplayer2.Parent := pnlblock1;

              end else if boardice2 = 2 then
              begin

                shplayer2.Parent := pnlblock2;

              end else if boardice2 = 3 then
              begin

                shplayer2.Parent := pnlblock3;

              end else if boardice2 = 4 then
              begin

                shplayer2.Parent := pnlblock4;

              end else if boardice2 = 5 then
              begin

                shplayer2.Parent := pnlblock5;

              end else if boardice2 = 6 then
              begin

                shplayer2.Parent := pnlblock6;

              end else if boardice1 = 7 then
             begin

               shplayer1.Parent := pnlblock7;

             end else if boardice1 = 8 then
             begin

               shplayer1.Parent := pnlblock8;

             end else if boardice1 = 9 then
             begin

               shplayer1.Parent := pnlblock9;

             end else if boardice1 = 10 then
             begin

               shplayer1.Parent := pnlblock10;

             end else if boardice1 = 11 then
             begin

               shplayer1.parent := pnlblock11;

             end else if boardice1 = 12 then
             begin

               shplayer1.Parent := pnlblock12;

             end else if boardice1 = 13 then
             begin

               shplayer1.Parent := pnlblock13;

             end else if boardice1 = 14 then
             begin

               shplayer1.Parent := pnlblock14;

             end else if boardice1 = 15 then
             begin

               shplayer1.Parent := pnlblock15;

             end else if boardice1 = 16 then
             begin

               shplayer1.parent := pnlblock16;

             end else if boardice1 = 17 then
             begin

               shplayer1.Parent := pnlblock17;

             end else if boardice1 = 18 then
             begin

               shplayer1.Parent := pnlblock18;

             end else if boardice1 = 19 then
             begin

               shplayer1.Parent := pnlend;

             end;

         end;
      end;
   end;
end;

end.

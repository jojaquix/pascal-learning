unit udbex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, PQConnection, Forms, Controls, Graphics, Dialogs,
  DBGrids, DBCtrls, StdCtrls, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin


end;

end.

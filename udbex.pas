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
    DataSource2: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZTable1: TZTable;
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

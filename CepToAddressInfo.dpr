program CepToAddressInfo;

uses
  Vcl.Forms,
  UCepInfo in 'UCepInfo.pas',
  UAbstractCepAPI in 'UAbstractCepAPI.pas',
  Main in 'Main.pas',
  UViaCepHandler in 'UViaCepHandler.pas',
  UApiCepHandler in 'UApiCepHandler.pas',
  UAwesomeApiHandler in 'UAwesomeApiHandler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.

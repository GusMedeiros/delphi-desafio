unit UAwesomeApiHandler;

interface
uses UAbstractCepAPI, System.JSON;
type TAwesomeApiHandler = class (TAbstractCepAPI)

public
  function JsonHasError(json :TJSONObject):boolean; override;
  constructor Create();
  end;


implementation

  function TAwesomeApiHandler.JsonHasError(json :TJSONObject):boolean;
  // as far as I understand, awesomeApi response json only has the status key if it's an error.
    var status:TJSONValue;
    begin
      Result := json.TryGetValue('status', status);
  end;

  constructor TAwesomeApiHandler.Create();
  begin
    inherited Create('https://cep.awesomeapi.com.br/json/%s');
  end;
end.

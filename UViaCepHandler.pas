unit UViaCepHandler;

interface
uses UAbstractCepAPI, System.JSON;
type TViaCepHandler = class (TAbstractCepAPI)

public
  function JsonHasError(json :TJSONObject):boolean; override;
  constructor Create();
  end;


implementation

  function TViaCepHandler.JsonHasError(json :TJSONObject):boolean;
  // seems like viacep's response json only has the error key if it's an actual
  // error, so no comparisons needed.
    var erro:TJSONValue;
    begin
      Result := json.TryGetValue('erro', erro);
  end;

  constructor TViaCepHandler.Create();
  begin
    inherited Create('viacep.com.br/ws/%s/json/');
  end;
end.

unit UApiCepHandler;

interface
uses UAbstractCepAPI, System.JSON;
type TApiCepHandler = class (TAbstractCepAPI)

public
  function JsonHasError(json :TJSONObject):boolean; override;
  constructor Create();
  end;


implementation

  function TApiCepHandler.JsonHasError(json :TJSONObject):boolean;
  // ApiCep's json response always has the 'status' key, so it's an error if it's different than "200"
    var status:TJSONValue;
    begin
    if json.TryGetValue('status', status) then
      Result := (status <> nil) and (status.Value <> '200')
    else
    Result := False;
    // Result := status = nil or status.Value <> '200'; this is considered an error for some reason
  end;

  constructor TApiCepHandler.Create();
  begin
    inherited Create('https://cdn.apicep.com/file/apicep/%s.json');
  end;
end.

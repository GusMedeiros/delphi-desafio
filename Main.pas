unit Main;

interface
uses
UAbstractCepAPI,
UViaCepHandler,
UApiCepHandler,
UAwesomeApiHandler,
SysUtils,
System.JSON;

  function GetCepInfo(cep: string): TJsonObject;

end

implementation


function GetCepInfo(cep: string): TJsonObject;
var
  apiArray: array of UAbstractCepAPI.TAbstractCepAPI;
  api: UAbstractCepApi.TAbstractCepAPI;
  response: TJsonObject;

  begin
      Result := nil;
      // populating the array wit the api alternatives
      SetLength(apiArray, 3);
      apiArray[0] := UViaCepHandler.TViaCepHandler.Create();
      apiArray[1] := UApiCepHandler.TApiCepHandler.Create();
      apiArray[2] := UAwesomeApiHandler.TAwesomeApiHandler.Create();

      for api in apiArray do
        try
           response := api.GetCepInfo(cep);
           if not api.JsonHasError(response) then
            begin
              Result := response;
              Exit();
            end;
           except
           on E: Exception do
           begin
           end;
      end;
  end;
end.

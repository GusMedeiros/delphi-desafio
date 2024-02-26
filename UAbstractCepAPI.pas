unit UAbstractCepAPI;

interface
uses
  System.JSON,
  UCepInfo,
  SysUtils;
type
  TAbstractCepAPI = class abstract(TInterfacedObject, ICepInfo)

  public
    function GetCepInfo(const cep: string): TJSONObject;
    function JsonHasError(json :TJSONObject):boolean; virtual; abstract;
    constructor Create(const url: string);


  private
    url : string;
  end;
implementation
  uses
    IdHttp;

  function TAbstractCepAPI.GetCepInfo(const cep: string): TJSONObject;
    var
    http: TIdHTTP;
    responseString: string;
    responseJSON: TJSONObject;
    formattedUrl: string;
  begin
      Format(formattedUrl, [cep]);
      http := TIdHTTP.Create(nil);
      responseJSON := TJSONObject.ParseJSONValue(http.Get(formattedUrl)) as TJSONObject;
      Result := responseJSON;
  end;

  constructor TAbstractCepAPI.Create(const url: string);
  begin
    inherited Create;
    self.url := url;
  end;

  end.

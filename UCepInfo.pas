unit UCepInfo;

interface

uses System.JSON;
type
  ICepInfo = interface
    function GetCepInfo(const CEP: string): TJSONObject;
  end;

implementation

end.


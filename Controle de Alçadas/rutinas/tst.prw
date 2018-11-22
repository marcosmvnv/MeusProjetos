#include "Totvs.ch"


/*/{Protheus.doc} Tst
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
User Function Tst()
Local oRestClient
Local cJson		:= ""
Local aHeader	:= {}
Local cCodUser	:= "000000"
Local cSenha	:= "admin"
Local oHelperAprovador
Local oAprovador

RpcSetType(3)
RpcSetEnv('99')

oRestClient := FWRest():New("http://192.168.1.82:8080")
 
// inclui o campo Authorization no formato <usuario>:<senha> na base64
Aadd(aHeader, "Authorization: Basic " + Encode64("admin:admin"))
 
// chamada da classe exemplo de REST com retorno de lista
//oRestClient:setPath("/rest/PRODUTOS?CODPRODUTO=000001")
//If oRestClient:Get(aHeader)
//   ConOut("GET", oRestClient:GetResult())
//Else
//   ConOut("GET", oRestClient:GetLastError())
//EndIf
  
// chamada da classe exemplo de REST para operações CRUD
oRestClient:setPath("/rest/WSAPROVADOR/" + cCodUser)
If oRestClient:Get(aHeader)
   cJson := oRestClient:GetResult()
   
   oHelperAprovador := UYHelperAprovador():New()
   oAprovador := oHelperAprovador:Json2Aprov(cJson)
   
//   oHelperAprovador:Destroy()
   oRestClient:setPath("/rest/WSPEDCOMPRAS?CODAPROVADOR=" + oAprovador:GetcID() + "&STATUS=01")
   
   If oRestClient:Get(aHeader)
   		cJson := oRestClient:GetResult()
   Else
   		ConOut("GET", oRestClient:GetLastError())
   EndIF
Else
   ConOut("GET", oRestClient:GetLastError())
EndIf

RpcClearEnv()
Return
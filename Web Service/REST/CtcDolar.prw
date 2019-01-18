#include "totvs.ch"

User Function CtcDolar()
Local dData
Local cUrl := "http://api.bcb.gov.br"
Local oRestClient := FWRest():New(cUrl)
Local aHeader := {}

aadd(aHeader,'formato:  json')
aadd(aHeader,'dataInicial: '+ CtoD("08/01/2019"))
aadd(aHeader,'dataFinal: '	+ CtoD("08/01/2019"))

oRestClient:setPath("/dados/serie/bcdata.sgs.10813/dados")

If oRestClient:Get(aHeader)
	ConOut(oRestClient:GetResult())
Else
   conout(oRestClient:GetLastError())
EndIF

Return

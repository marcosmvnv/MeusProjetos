#Include "Totvs.ch"
#Include "FWMVCDEF.ch"
#Include 'RestFul.CH'

User Function auth01()
Return

WSRESTFUL UYAUTH01 DESCRIPTION "Autentica��o de Usu�rio"
	WSDATA xAuth AS Base64Binary
	WSMETHOD GET 	DESCRIPTION "Nome do Usu�rio" WSSYNTAX "/UYAUTH || /UYAUTH01/{}"
END WSRESTFUL

WSMETHOD GET WSSERVICE UYAUTH01

Local aArea := GetArea()
Local aParams := ::aURLParms
::SetContentType("application/json")


RestArea(aArea)
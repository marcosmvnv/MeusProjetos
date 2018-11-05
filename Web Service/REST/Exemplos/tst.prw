#include "totvs.ch"


User Function tst() 
Local aHeader	:= {}
Local cGetParms := ""
Local cUrl		:= "http://192.168.1.82:8080/rest/uyauth01"
Local nTimeOut	:= 120
Local cHeaderGet:= ""
Local xHtmlPage
RpcSetType(3)
RpcSetEnv("99")

aadd(aHeader,'Authorization: BASIC YWRtaW46YWRtaW4=')

xHtmlPage := HttpGet( cUrl, cGetParms, nTimeOut, aHeader, @cHeaderGet )

ConOut(xHtmlPage)
RpcClearEnv()
Return
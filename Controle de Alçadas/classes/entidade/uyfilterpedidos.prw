#include "Totvs.ch"

Class UYFilterPedidos From UYObject
	Data cIdSCR
	Data cIdSC7Ini
	Data cIdSC7Fim
	Data cStatusIni
	Data cStatusFim
	Data dEmissaoIni
	Data dEmissaoFim
	Data dDataLibIni
	Data dDataLibFim
	
	
	Method New() Constructor
	
	//Getters
	Method GetcIdSCR()
	Method GetcIdSC7Ini()
	Method GetcIdSC7Fim()
	Method GetcStatusIni()
	Method GetcStatusFim()
	Method GetdEmissaoIni()
	Method GetdEmissaoFim()
	Method GetdDataLibIni()
	Method GetdDataLibFim()
	
	//Setters
	Method SetcIdSCR(cIdSCR)
	Method SetcIdSC7Ini(cIdSC7Ini)
	Method SetcIdSC7Fim(cIdSC7Fim)
	Method SetcStatusIni(cStatusIni)
	Method SetcStatusFim(cStatusFim)
	Method SetdEmissaoIni(dEmissaoIni)
	Method SetdEmissaoFim(dEmissaoFim)
	Method SetdDataLibIni(dDataLibIni)
	Method SetdDataLibFim(dDataLibFim)
EndClass

Method New(cIdSCR,cIdSC7Ini,cIdSC7Fim,cStatusIni,cStatusFim,dEmissaoIni,dEmissaoFim,dDataLibIni,dDataLibFim) Class UYFilterPedidos
Default cIdSCR		:= ""
Default cIdSC7Ini	:= ""
Default cIdSC7Fim	:= Replicate("Z", TamSx3("C7_NUM")[1])
Default cStatusIni	:= ""
Default cStatusFim	:= Replicate("Z", TamSx3("CR_STATUS")[1])
Default dEmissaoIni	:= CToD("")
Default dEmissaoFim	:= CToD("31/12/2045"
Default dDataLibIni	:= CToD("")
Default dDataLibFim	:= CToD("31/12/2045"
_Super:New()
Return Self

Method GetcIdSCR() Class UYFilterPedidos
Return :cIdSCR

Method GetcIdSC7Ini() Class UYFilterPedidos
Return :cIdSC7Ini

Method GetcIdSC7Fim() Class UYFilterPedidos
Return :cIdSC7Fim

Method GetcStatusIni() Class UYFilterPedidos
Return :cStatusIni

Method GetcStatusFim() Class UYFilterPedidos
Return :cStatusFim

Method GetdEmissaoIni() Class UYFilterPedidos
Return :dEmissaoIni

Method GetdEmissaoFim() Class UYFilterPedidos
Return :dEmissaoFim

Method GetdDataLibIni() Class UYFilterPedidos
Return :dDataLibIni

Method GetdDataLibFim() Class UYFilterPedidos
Return :dDataLibFim

Method SetcIdSCR(cIdSCR) Class UYFilterPedidos
IF ValType(cIdSCR) == "C"
	:cIdSCR := cIdSCR
EndIF
Return
Method SetcIdSC7Ini(cIdSC7Ini) Class UYFilterPedidos
IF ValType(cIdSC7Ini) == "C"
	:cIdSC7Ini := cIdSC7Ini
EndIF
Return
Method SetcIdSC7Fim(cIdSC7Fim) Class UYFilterPedidos
IF ValType(cIdSC7Fim) == "C"
	:cIdSC7Fim := cIdSC7Fim
EndIF
Return
Method SetcStatusIni(cStatusIni) Class UYFilterPedidos
IF ValType(cStatusIni) == "C"
	:cStatusIni := cStatusIni
EndIF
Return
Method SetcStatusFim(cStatusFim) Class UYFilterPedidos
IF ValType(cStatusFim) == "C"
	:cStatusFim := cStatusFim
EndIF
Return
Method SetdEmissaoIni(dEmissaoIni) Class UYFilterPedidos
IF ValType(dEmissaoIni) == "D"
	:dEmissaoIni := dEmissaoIni
EndIF
Return
Method SetdEmissaoFim(dEmissaoFim) Class UYFilterPedidos
IF ValType(dEmissaoFim) == "D"
	:dEmissaoFim := dEmissaoFim
EndIF
Return
Method SetdDataLibIni(dDataLibIni) Class UYFilterPedidos
IF ValType(dDataLibIni) == "D"
	:dDataLibIni := dDataLibIni
EndIF
Return
Method SetdDataLibFim(dDataLibFim) Class UYFilterPedidos
IF ValType(dDataLibFim) == "D"
	:dDataLibFim := dDataLibFim
EndIF
Return


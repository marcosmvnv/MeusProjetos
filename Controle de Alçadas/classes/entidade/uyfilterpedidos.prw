#include "Totvs.ch"

Class UYFilterPedidos From UYObject
	Data cIdSAK
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
	Method GetcIdSAK()
	Method GetcIdSC7Ini()
	Method GetcIdSC7Fim()
	Method GetcIniStatus()
	Method GetcFimStatus()
	Method GetdIniEmissao()
	Method GetdFimEmissao()
	Method GetdIniDataLib()
	Method GetdFimDataLib()
	
	//Setters
	Method SetcIdSAK(cIdSAK)
	Method SetcIdSC7Ini(cIdSC7Ini)
	Method SetcIdSC7Fim(cIdSC7Fim)
	Method SetcStatusIni(cStatusIni)
	Method SetcFimStatus(cStatusFim)
	Method SetdIniEmissao(dEmissaoIni)
	Method SetdFimEmissao(dEmissaoFim)
	Method SetdIniDataLib(dDataLibIni)
	Method SetdFimDataLib(dDataLibFim)
EndClass

Method New(cIdSAK, cIdSC7Ini,cIdSC7Fim,cStatusIni,cStatusFim,dEmissaoIni,dEmissaoFim,dDataLibIni,dDataLibFim) Class UYFilterPedidos
Default cIdSAK		:= ""
Default cIdSC7Ini	:= ""
Default cIdSC7Fim	:= Replicate("Z", TamSx3("C7_NUM")[1])
Default cStatusIni	:= ""
Default cStatusFim	:= Replicate("Z", TamSx3("CR_STATUS")[1])
Default dEmissaoIni	:= CToD("")
Default dEmissaoFim	:= CToD("31/12/2049")
Default dDataLibIni	:= CToD("")
Default dDataLibFim	:= CToD("31/12/2049")
_Super:New()

Self:SetcIdSAK(cIdSAK)
Self:SetcIdSC7Ini(cIdSC7Ini)
Self:SetcIdSC7Fim(cIdSC7Fim)
Self:SetcStatusIni(cStatusIni)
Self:SetcFimStatus(cStatusFim)
Self:SetdIniEmissao(dEmissaoIni)
Self:SetdFimEmissao(dEmissaoFim)
Self:SetdIniDataLib(dDataLibIni)
Self:SetdFimDataLib(dDataLibFim)
Return Self

Method GetcIdSAK() Class UYFilterPedidos
Return ::cIdSAK

Method GetcIdSC7Ini() Class UYFilterPedidos
Return ::cIdSC7Ini

Method GetcIdSC7Fim() Class UYFilterPedidos
Return ::cIdSC7Fim

Method GetcIniStatus() Class UYFilterPedidos
Return ::cStatusIni

Method GetcFimStatus() Class UYFilterPedidos
Return ::cStatusFim

Method GetdIniEmissao() Class UYFilterPedidos
Return ::dEmissaoIni

Method GetdFimEmissao() Class UYFilterPedidos
Return ::dEmissaoFim

Method GetdIniDataLib() Class UYFilterPedidos
Return ::dDataLibIni

Method GetdFimDataLib() Class UYFilterPedidos
Return ::dDataLibFim

Method SetcIdSAK(cIdSAK) Class UYFilterPedidos
IF ValType(cIdSAK) == "C"
	::cIdSAK := cIdSAK
EndIF
Return
Method SetcIdSC7Ini(cIdSC7Ini) Class UYFilterPedidos
IF ValType(cIdSC7Ini) == "C"
	::cIdSC7Ini := cIdSC7Ini
EndIF
Return
Method SetcIdSC7Fim(cIdSC7Fim) Class UYFilterPedidos
IF ValType(cIdSC7Fim) == "C"
	::cIdSC7Fim := cIdSC7Fim
EndIF
Return
Method SetcStatusIni(cStatusIni) Class UYFilterPedidos
IF ValType(cStatusIni) == "C"
	::cStatusIni := cStatusIni
EndIF
Return
Method SetcFimStatus(cStatusFim) Class UYFilterPedidos
IF ValType(cStatusFim) == "C"
	::cStatusFim := cStatusFim
EndIF
Return
Method SetdIniEmissao(dEmissaoIni) Class UYFilterPedidos
IF ValType(dEmissaoIni) == "D"
	::dEmissaoIni := dEmissaoIni
EndIF
Return
Method SetdFimEmissao(dEmissaoFim) Class UYFilterPedidos
IF ValType(dEmissaoFim) == "D"
	::dEmissaoFim := dEmissaoFim
EndIF
Return
Method SetdIniDataLib(dDataLibIni) Class UYFilterPedidos
IF ValType(dDataLibIni) == "D"
	::dDataLibIni := dDataLibIni
EndIF
Return
Method SetdFimDataLib(dDataLibFim) Class UYFilterPedidos
IF ValType(dDataLibFim) == "D"
	::dDataLibFim := dDataLibFim
EndIF
Return


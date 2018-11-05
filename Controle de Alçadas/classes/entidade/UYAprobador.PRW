#include "Totvs.ch"

Class UYAprovador From UYObject
	Data cFil		
	Data cIdSAK		
	Data oUsuario		
	Data cApros		
	Data cTipo		
	Data nLimite	
	Data cMoeda		
//	Data nLimMin	//AK_LIMMIN				-> Limite Minimo
//	Data nLimMax	//AK_LIMMAX				-> Limite Maximo
	
	Method New(cFil, cIdSAK, oUsuario, cApros, cTipo, nLimite, cMoeda) Constructor
	
	//Getters
	Method GetcFil()		
	Method GetcIdSAK()		
	Method GetoUsuario()		
	Method GetcApros()		
	Method GetcTipo()		
	Method GetnLimite()	
	Method GetcMoeda()
	//Setters
	Method SetcFil(cFil)		
	Method SetcIdSAK(cIdSAK)		
	Method SetoUsuario(oUsuario)		
	Method SetcApros(cApros)		
	Method SetcTipo(cTipo)		
	Method SetnLimite(nLimite)	
	Method SetcMoeda(cMoeda)		
EndClass

New(cFil, cIdSAK, oUsuario) Class UYAprovador
Default cFil 		:= xFilial("SAK")
Default cIdSAK 		:= ""
Default oUsuario	:= UYUsuario():New()

_Super:New()

IF ValType(cFil) == "C"
	::cFil := cFil
EndIF
IF ValType(oUsuario) == "O"
	::oUsuario := oUsuario
EndIF
IF ValType(cIdSAK) == "C"
	::cIdSAK := cIdSAK
EndIF
Return ::

Method GetcFil() Class UYAprovador		
Return ::cFil

Method GetcIdSAK() Class UYAprovador	
Return ::cIdSAK

Method GetoUsuario() Class UYAprovador		
Return ::oUsuario

Method GetcApros() Class UYAprovador		
Return ::cApros

Method GetcTipo() Class UYAprovador		
Return ::cTipo

Method GetnLimite() Class UYAprovador	
Return ::nLimite

Method GetcMoeda() Class UYAprovador
Return ::cMoeda


//Setters
Method SetcFil(cFil) Class UYAprovador
IF ValType(cFil) == "C"
	::cFil := cFil
EndIF	
Return
		
Method SetcIdSAK(cIdSAK)	 Class UYAprovador
IF ValType(cIdSAK) == "C"
	::cIdSAK := cIdSAK
EndIF
Return	

Method SetoUsuario(oUsuario) Class UYAprovador
IF ValType(oUsuario) == "O"
	::oUsuario := oUsuario
EndIF
Return
		
Method SetcApros(cApros) Class UYAprovador
IF ValType(cApros) == "C"
	::cApros := cApros
EndIF	
Return

Method SetcTipo(cTipo) Class UYAprovador		
IF ValType(cTipo) == "C"
	::cTipo := cTipo
EndIF
Return

Method SetnLimite(nLimite) Class UYAprovador	
IF ValType(nLimite) == "N"
	::nLimite := nLimite
EndIF
Return

Method SetcMoeda(cMoeda) Class UYAprovador	
IF ValType(cMoeda) == "C"
	::cMoeda := cMoeda
EndIF
Return

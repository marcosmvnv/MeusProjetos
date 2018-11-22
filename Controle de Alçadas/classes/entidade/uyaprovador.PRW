#include "Totvs.ch"

Class UYAprovador From UYObject
	Data cFil		
	Data cId		
	Data oUsuario		
	Data cAproSup		
	Data cTipo		
	Data nLimite	
	Data nMoeda		
	Data nLimMin	//AK_LIMMIN				-> Limite Minimo
	Data nLimMax	//AK_LIMMAX				-> Limite Maximo
	
	Method New(cFil, cId, oUsuario, cAproSup, cTipo, nLimite, nMoeda, nLimMin, nLimMin) Constructor
	
	//Getters
	Method GetcFil()		
	Method GetcId()		
	Method GetoUsuario()		
	Method GetcAproSup()		
	Method GetcTipo()		
	Method GetnLimite()	
	Method GetnLimMin()
	Method GetnLimMax()
	Method GetnMoeda()
	//Setters
	Method SetcFil(cFil)		
	Method SetcId(cId)		
	Method SetoUsuario(oUsuario)		
	Method SetcAproSup(cAproSup)		
	Method SetcTipo(cTipo)		
	Method SetnLimite(nLimite)	
	Method SetnLimMin(nLimMin)
	Method SetnLimMax(nLimMax)
	Method SetnMoeda(nMoeda)			
	Method GetcClassName()
EndClass

Method New(cFil, cId, oUsuario) Class UYAprovador
Default cFil 		:= xFilial("SAK")
Default cId 		:= ""
Default oUsuario	:= UYUsuario():New()

_Super:New()

IF ValType(cFil) == "C"
	::cFil := cFil
EndIF
IF ValType(oUsuario) == "O"
	::oUsuario := oUsuario
EndIF
IF ValType(cId) == "C"
	::cId := cId
EndIF
Return Self

Method GetcFil() Class UYAprovador		
Return ::cFil

Method GetcId() Class UYAprovador	
Return ::cId

Method GetoUsuario() Class UYAprovador		
Return ::oUsuario

Method GetcAproSup() Class UYAprovador		
Return ::cAproSup

Method GetcTipo() Class UYAprovador		
Return ::cTipo

Method GetnLimite() Class UYAprovador	
Return ::nLimite

Method GetnLimMin() Class UYAprovador	
Return ::nLimMin

Method GetnLimMax() Class UYAprovador	
Return ::nLimMax


Method GetnMoeda() Class UYAprovador
Return ::nMoeda


//Setters
Method SetcFil(cFil) Class UYAprovador
IF ValType(cFil) == "C"
	::cFil := cFil
EndIF	
Return
		
Method SetcId(cId)	 Class UYAprovador
IF ValType(cId) == "C"
	::cId := cId
EndIF
Return	

Method SetoUsuario(oUsuario) Class UYAprovador
IF ValType(oUsuario) == "O"
	::oUsuario := oUsuario
EndIF
Return
		
Method SetcAproSup(cAproSup) Class UYAprovador
IF ValType(cAproSup) == "C"
	::cAproSup := cAproSup
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

Method SetnLimMin(nLimMin) Class UYAprovador	
IF ValType(nLimMin) == "N"
	::nLimMin := nLimMin
EndIF
Return

Method SetnLimMax(nLimMax) Class UYAprovador	
IF ValType(nLimMax) == "N"
	::nLimMax := nLimMax
EndIF
Return

Method SetnMoeda(nMoeda) Class UYAprovador	
IF ValType(nMoeda) == "N"
	::nMoeda := nMoeda
EndIF
Return

Method GetcClassName() Class UYAprovador
Return "UYAPROVADOR"
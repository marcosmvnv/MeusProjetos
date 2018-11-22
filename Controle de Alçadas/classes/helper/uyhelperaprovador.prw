#include "Totvs.ch"

CLASS UYHelperAprovador FROM UYObject
	//Method Get
	METHOD GetoAprovador()
	//Method Constructor	
	METHOD New() Constructor
	//Method Especificos
	METHOD GetcClassName()	
	METHOD Json2Aprov(cJson)
ENDCLASS

/*/{Protheus.doc} New
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
Method New() Class UYHelperAprovador
_Super:New()
Return Self

/*/{Protheus.doc} GetcClassName
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
METHOD GetcClassName() Class UYHelperAprovador
Return "UYHelperAprovador"

/*/{Protheus.doc} Json2Aprov
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}
@param cJson, characters, description
@type function
/*/
METHOD Json2Aprov(cJson) Class UYHelperAprovador
Local oAprovador 
Local oObj

IF !Empty(cJson)
	If FWJsonDeserialize(cJson,@oObj)		
		oAprovador := UYAprovador():New()
		oAprovador:SetcId(oObj:cID)		
		oAprovador:SetoUsuario(oObj:oUsuario)		
		oAprovador:SetcAproSup(oObj:cAproSup)		
		oAprovador:SetcTipo(oObj:cTipo)		
		oAprovador:SetnLimite(oObj:nLimite)	
		oAprovador:SetnLimMin(oObj:nLimite)
		oAprovador:SetnLimMax(oObj:nLimMax)
		oAprovador:SetnMoeda(oObj:nMoeda)			
   Endif
EndIf

Return oAprovador


/*/{Protheus.doc} GetoAprovador
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
METHOD GetoAprovador() Class UYHelperAprovador
Return ::oAprovador

#include "Totvs.ch"

/*/{Protheus.doc} UYCGDAOClasseValor
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/11/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
CLASS UYCGDAOClasseValor From UYObject
	//CRUD DAO
	METHOD Insert(oCLValor)
	//Constructor
	METHOD New() Constructor
	//Methods Especificos
	METHOD GetcClassName()
ENDCLASS

METHOD New() Class UYCGDAOClasseValor
_Super:New()
Return
/*/{Protheus.doc} Insert
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/11/2018
@version 1.0
@return ${return}, ${return_description}
@param oCLValor, object, description
@type function
/*/
METHOD Insert(oCLValor) Class UYCGDAOClasseValor
Local aArea		:= GetArea()
Local lRet 		:= .T.
Local aCabec	:= {}
Local nOpcAuto	:= 3 //Inclusion
Local cMsgError	:= ""
Local aMsgSoluc	:= {}
Local cLogTxt	:= ""
Local nAux		:= 0

Private lMsErroAuto 	:= .F.

IF ValType(oCLValor) == "O" .And. UPPER(oCLValor:GetcClassName()) == "UYCGCLASSEVALOR"
	
	AAdd(aCabec, {"CTH_FILIAL"	, oCLValor:GetcFil()	, Nil})
	AAdd(aCabec, {"CTH_CLVL"	, oCLValor:GetcClVl()	, Nil})
	AAdd(aCabec, {"CTH_CLASSE"	, oCLValor:GetcClasse()	, Nil})
	AAdd(aCabec, {"CTH_DESC01"	, oCLValor:GetcDesc01()	, Nil})
	AAdd(aCabec, {"CTH_BLOQ"	, oCLValor:GetcBloq()	, Nil})
	AAdd(aCabec, {"CTH_CLSUP"	, oCLValor:GetcClSup()	, Nil})
		
	IF !isBlind()
		If FindFunction("FWMsgRun")
			FWMsgRun(, {|oSay| CTBA060(aCabec,nOpcAuto)	 }, "Procesando", "Incluindo Classe Valor: " + oCLValor:GetcClVl())
		ElseIf FindFunction("Processa")
			Processa( {|oSay|  CTBA060(aCabec,nOpcAuto)	 }, "Procesando", "Incluindo Classe Valor: " + oCLValor:GetcClVl())
		EndIF
	Else
		CTBA060(aCabec,nOpcAuto)					
	EndIf
	
	IF lMsErroAuto
		lRet := .F.
		
		IF !isBlind()
			MostraErro()		
		Else			
			ConOut( FunName() +"|"+ Time() + "|Erro na inclusao da Classe Valor Analitica: "+oCLValor:GetcClVl())
			ConOut( FunName() +"|"+ Time() + MostraErro())
		EndIF
	EndIF
Else
	lRet := .F.
	If !isBlind()
		cMsgError := "Falha na inclusion del Classe Valor. Formato de dados ou classe usada invalida!"
		aAdd(aMsgSoluc, "Entre en contato com equipe suporte Totvs UY")
		Help( , , "Clase Valor", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)		
	Else
		ConOut("Falha na inclusion del Classe Valor. Formato de dados ou classe usada invalida!")
	EndIF
EndIf

RestArea(aArea)
Return lRet


/*/{Protheus.doc} GetcClassName
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
METHOD GetcClassName() Class UYCGDAOClasseValor
Return "UYCGDAOCLASSEVALOR"
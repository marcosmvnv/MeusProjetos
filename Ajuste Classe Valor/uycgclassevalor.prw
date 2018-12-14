#include "Totvs.ch"

/*/{Protheus.doc} UYCGClasseValor
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/11/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
CLASS UYCGClasseValor From UYObject
	//Atributos
	DATA cFil 
	DATA cClVl 
	DATA cClasse 
	DATA cNormal
	DATA cDesc01 
	DATA cBloq 
	DATA cClSup
	//Getters
	METHOD GetcFil()
	METHOD GetcClVl() 
	METHOD GetcClasse() 
	METHOD GetcNormal()
	METHOD GetcDesc01() 
	METHOD GetcBloq() 
	METHOD GetcClSup()
	//Setters
	METHOD SetcFil(cFil)
	METHOD SetcClVl(cClVl) 
	METHOD SetcClasse(cClasse) 
	METHOD SetcNormal(cNormal)
	METHOD SetcDesc01(cDesc01) 
	METHOD SetcBloq(cBloq) 
	METHOD SetcClSup(cClSup)	
	//Contructor
	METHOD New(cFil,cClVl,cClasse,cNormal,cDesc01,cBloq,cClSup) Constructor
	//Methods Específicos
	METHOD GetcClassName()
ENDCLASS

METHOD New(cFil,cClVl,cClasse,cNormal,cDesc01,cBloq,cClSup) Class UYCGClasseValor
Default cFil	:= xFilial("CTH")
Default cClVl 	:= ""
Default cClasse := ""
Default cNormal	:= ""
Default cDesc01 := ""
Default cBloq 	:= ""
Default cClSup	:= ""

::SetcFil(cFil)
::SetcClVl(cClVl) 
::SetcClasse(cClasse) 
::SetcNormal(cNormal)
::SetcDesc01(cDesc01) 
::SetcBloq(cBloq) 
::SetcClSup(cClSup)
_Super:New()

/********************METODOS GETTERS*******************/
METHOD GetcFil() Class UYCGClasseValor     
Return ::cFil

METHOD GetcClVl() Class UYCGClasseValor     
Return ::cClVl

METHOD GetcClasse() Class UYCGClasseValor     
Return ::cClasse

METHOD GetcNormal() Class UYCGClasseValor     
Return ::cNormal

METHOD GetcDesc01() Class UYCGClasseValor     
Return ::cDesc01

METHOD GetcBloq() Class UYCGClasseValor     
Return ::cBloq

METHOD GetcClSup() Class UYCGClasseValor     
Return ::cClSup

/*******************METODOS SETTERS*******************/
METHOD SetcFil(cFil) Class UYCGClasseValor     
IF ValType(cFil) == 'C' 
	::cFil := cFil
EndIf
Return

METHOD SetcClVl(cClVl) Class UYCGClasseValor     
IF ValType(cClVl) == 'C' 
	::cClVl := cClVl
EndIf
Return

METHOD SetcClasse(cClasse) Class UYCGClasseValor     
IF ValType(cClasse) == 'C' 
	::cClasse := cClasse
EndIf
Return

METHOD SetcNormal(cNormal) Class UYCGClasseValor     
IF ValType(cNormal) == 'C' 
	::cNormal := cNormal
EndIf
Return

METHOD SetcDesc01(cDesc01) Class UYCGClasseValor     
IF ValType(cDesc01) == 'C' 
	::cDesc01 := cDesc01
EndIf
Return

METHOD SetcBloq(cBloq) Class UYCGClasseValor     
IF ValType(cBloq) == 'C' 
	::cBloq := cBloq
EndIf
Return

METHOD SetcClSup(cClSup) Class UYCGClasseValor     
IF ValType(cClSup) == 'C' 
	::cClSup := cClSup
EndIf
Return

/*/{Protheus.doc} GetcClassName
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
METHOD GetcClassName() CLASS UYCGClasseValor
Return "UYCGCLASSEVALOR"
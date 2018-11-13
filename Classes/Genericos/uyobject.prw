#include "Totvs.ch"

/*/{Protheus.doc} UYObject
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 25/10/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
Class UYObject	
	//Method Construtor
	METHOD New() Constructor
			
	//Methods 
	METHOD Destroy()
EndClass


/*/{Protheus.doc} New
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 25/10/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
METHOD New() Class UYObject
Return Self

/*/{Protheus.doc} Destroy
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 25/10/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
METHOD Destroy() Class UYObject
IF Self != Nil
	FreeObj(Self)
	Self := Nil
EndIF
Return

User Function UYObject()
Local oObject := Nil

RPCSetType(3)
RpcSetEnv("99")

oObject := UYObject():New()
//ConOut(oObjetc:GetClassName()
msgalert("ola","TESTE")
oObject:Destroy()
RpcClearEnv()
Return
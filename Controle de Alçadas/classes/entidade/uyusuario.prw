#include "Totvs.ch"

Class UYUsuario
//	Atributos
	Data cID
	Data cSenha
	Data cNome
	Data cEmail
	Data cDpto
	Data cCargo
//	Constructor
	Method New() Constructor
//	Getters
	Method GetcID() 	
	Method GetcSenha() 	
	Method GetcNome() 	
	Method GetcEmail()	
	Method GetcDpto() 	
	Method GetcCargo() 
//	Setters
	Method SetcID(cID) 	
	Method SetcSenha(cSenha) 	
	Method SetcNome(cNome) 	
	Method SetcEmail(cEmail)	
	Method SetcDpto(cDpto) 	
	Method SetcCargo(cCargo) 	
	
EndClass

/*/{Protheus.doc} New
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 30/10/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
Method New() Class UYUsuario
Return Self

//Getters
Method GetcID() Class UYUsuario
Return ::cID
 	
//Method GetcSenha() Class UYUsuario
//Return ::cSenha

Method GetcNome() Class UYUsuario
Return ::cNome
 	
Method GetcEmail() Class UYUsuario
Return ::cEmail	

Method GetcDpto() Class UYUsuario
Return ::cDpto	

Method GetcCargo() Class UYUsuario
Return ::cCargo

//Setters

Method SetcID(cID) 	Class UYUsuario
IF ValType(cID) == "C"
	::cID := cID
EndIF
Return

Method SetcSenha(cSenha) Class UYUsuario
IF ValType(cSenha) == "C"
	::cSenha := cSenha
EndIF
Return	

Method SetcNome(cNome) 	Class UYUsuario
IF ValType(cNome) == "C"
	::cNome := cNome
EndIF
Return

Method SetcEmail(cEmail)	Class UYUsuario
IF ValType(cEmail) == "C"
	::cEmail := cEmail
EndIF
Return

Method SetcDpto(cDpto) 	Class UYUsuario
IF ValType(cDpto) == "C"
	::cDpto := cDpto
EndIF
Return

Method SetcCargo(cCargo) Class UYUsuario
IF ValType(cCargo) == "C"
	::cCargo := cCargo
EndIF
Return
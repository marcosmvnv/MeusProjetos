#include "Totvs.ch"

Class UYUsuario
//	Atributos
	Data cID
	Data cUser
	Data cSenha
	Data cNome
	Data cEmail
	Data cDpto
	Data cCargo
//	Constructor
	Method New() Constructor
//	Getters
	Method GetcID() 	
	Method GetcUser()
	Method GetcSenha() 	
	Method GetcNome() 	
	Method GetcEmail()	
	Method GetcDpto() 	
	Method GetcCargo() 
//	Setters
	Method SetcID(cID) 	
	Method SetcUser(cUser)
	Method SetcSenha(cSenha) 	
	Method SetcNome(cNome) 	
	Method SetcEmail(cEmail)	
	Method SetcDpto(cDpto) 	
	Method SetcCargo(cCargo) 	
	
	//Especificos
	Method LoadUser()
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

Method GetcUser() Class UYUsuario
Return ::cUser
 	
Method GetcSenha() Class UYUsuario
Return ::cSenha

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
	
	Self:LoadUser()
EndIF
Return

Method SetcUser(cUser) 	Class UYUsuario
IF ValType(cUser) == "C"
	::cUser := cUser
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

Method LoadUser() Class UYUsuario
Local aArray := {}

IF Self != Nil .And. !Empty(Self:cId)
	PswOrder(1)
	If PswSeek( Self:cId, .T. )  
	   aArray := PswRet() // Retorna vetor com informações do usuário
		Self:SetcUser(aArray[1][2])
		Self:SetcSenha(aArray[1][3])
		Self:SetcNome(aArray[1][4])
		Self:SetcDpto(aArray[1][12])
		Self:SetcCargo(aArray[1][13])
		Self:SetcEmail(aArray[1][14])
	EndIf
EndIF
Return
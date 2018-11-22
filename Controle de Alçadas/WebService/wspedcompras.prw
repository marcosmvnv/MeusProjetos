#Include "Totvs.ch"
#Include "FWMVCDEF.ch"
#Include 'RestFul.CH'


/*/{Protheus.doc} wsPedCompras
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
User Function wsPedCompras()
Return


/*/{Protheus.doc} WSPEDCOMPRAS
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
WSRESTFUL WSPEDCOMPRAS DESCRIPTION "API Pedidos de Compra - Controle de Alçadas"
	//Atributos
	WSDATA CODAPROVADOR AS String
	WSDATA STATUS AS String
	//Methods
	WSMETHOD GET DESCRIPTION "Retorna todos os Pedidos de Compra do Usuario informado" 	WSSYNTAX "/WSPEDCOMPRAS || /WSPEDCOMPRAS/{}" 

END WSRESTFUL


/*/{Protheus.doc} GET
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 22/11/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
WSMETHOD GET WSRECEIVE CODAPROVADOR WSRECEIVE STATUS WSSERVICE WSPEDCOMPRAS
Local cAprovador	:= ""
Local cStatus		:= Self:STATUS
Local oDaoAprovador
Local oFilter
Local aPedidos		:= {}
// define o tipo de retorno do método
::SetContentType("application/json")

cAprovador := Self:CODAPROVADOR

IF !Empty(cAprovador)
	oFilter	:= UYFilterPedidos():New()
	oFilter:SetcIdSAK(cAprovador)
	
	oDaoAprovador := UYDAOAprovador():New()
	aPedidos := oDaoAprovador:ListaPedidos(oFilter)

Else

EndIf

Return .T.
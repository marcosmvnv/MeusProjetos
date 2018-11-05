#Include "Totvs.ch"
#Include "FWMVCDEF.ch"
#Include 'RestFul.CH'



/*/{Protheus.doc} ERest_01
//TODO Dummy Function
@author Marcos Vieira
@since 25/10/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
User Function ERest_01()
Return


/*/{Protheus.doc} PRODUTOS
//TODO Web Service de Produtos
@author Marcos Vieira
@since 25/10/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
WSRESTFUL PRODUTOS DESCRIPTION "Serviço REST para manipulação de Produtos"

	WSDATA CODPRODUTO As String
//	WSDATA Float
//	WSDATA Boolean
//	WSDATA String
//	WSDATA Array
//	WSDATA Integer
	WSMETHOD GET 	DESCRIPTION "Retorna o produto informado na URL" WSSYNTAX "/PRODUTOS || /PRODUTOS/{}"
//	WSMETHOD GET	DESCRIPTION -> Descrição do método.				SYNTAX -> Sintaxe HTTP da chamada REST. Esta informação é utilizada na documentação do REST.
//	WSMETHOD POST	DESCRIPTION -> Descrição do método.				SYNTAX -> Sintaxe HTTP da chamada REST. Esta informação é utilizada na documentação do REST.
//	WSMETHOD UPDATE	DESCRIPTION -> Descrição do método.				SYNTAX -> Sintaxe HTTP da chamada REST. Esta informação é utilizada na documentação do REST.
//	WSMETHOD DELETE	DESCRIPTION -> Descrição do método.				SYNTAX -> Sintaxe HTTP da chamada REST. Esta informação é utilizada na documentação do REST.
END WSRESTFUL


/*/{Protheus.doc} GET
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 25/10/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
WSMETHOD GET WSRECEIVE CODPRODUTO WSSERVICE PRODUTOS
Local cCodProd := Self:CODPRODUTO
Local aArea    := GetArea()
Local oObjProd := Nil
Local cStatus  := ""
Local cJson    := ""

::SetContentType("application/json")
ConOut("OBAOBA Tipo Variavel: "+ ValType(cCodProd))
DbSelectArea("SB1")
SB1->( DbSetOrder(1) )
If SB1->( MsSeek( xFilial("SB1") + cCodProd ) )
    cStatus  := Iif( SB1->B1_MSBLQL == "1", "Sim", "Nao" )
    oObjProd := Produtos():New(SB1->B1_DESC, SB1->B1_UM, cStatus)
EndIf
IF oObjProd != Nil

	cJson := FWJsonSerialize(oObjProd)
	
	::SetResponse(cJson)
EndIF

RestArea(aArea)

Return(.T.)


Class Produtos
	
	Data cCodigo	As String
	Data cUM	  	As String
	Data cStatus 	As String 
	
	Method New(cCodigo, cUM, cStatus) Constructor 
EndClass

Method New(cCodProd, cUnidMed, cStatusPrd) Class Produtos
::cCodigo := cCodProd
::cUM 	  := cUnidMed
::cStatus := cStatusPrd
Return(Self)
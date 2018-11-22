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
User Function wsAprovador()
Return


/*/{Protheus.doc} Aprovador
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 20/11/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
WSRESTFUL WSAPROVADOR DESCRIPTION "REST Aprovador do Controle de Alçadas - Totvs"
	//Atributos
	WSDATA CODUSER AS String
	//Methods
	WSMETHOD GET  	DESCRIPTION "Exemplo de retorno de entidade(s)" 	WSSYNTAX "/WSAPROVADOR || /WSAPROVADOR/{}" 
//	WSMETHOD GET 	DESCRIPTION "Retorna o produto informado na URL" 	WSSYNTAX "/PRODUTOS || /PRODUTOS/{}"
//	WSMETHOD GET id_do_servico 	DESCRIPTION "descricao para o servico" 			WSSYNTAX "assets/{pathparam1}/{pathparam2}" PATH "assets/{pathparam1}/{pathparam2}"
//	WSMETHOD POST 				DESCRIPTION "Exemplo de inclusao de entidade" 	WSSYNTAX "/Aprovador/{cIdUser}"
//	WSMETHOD PUT 				DESCRIPTION "Exemplo de alteração de entidade" 	WSSYNTAX "/Aprovador/{cIdUser}"
//	WSMETHOD DELETE 			DESCRIPTION "Exemplo de exclusão de entidade"	WSSYNTAX "/Aprovador/{cIdUser}"

END WSRESTFUL


WSMETHOD GET WSRECEIVE CODUSER WSSERVICE WSAPROVADOR
Local cCodUser		:= ""
Local cJson			:= ""
Local aArea			:= GetArea()
Local oAprovador
Local oDaoAprovador

// define o tipo de retorno do método
::SetContentType("application/json")


//::SetResponse("teste")
//return .T.

If Len(::aURLParms) > 0
  If Len(::aURLParms) > 1
  	SetRestFault(400,"Quantidade de Parametros invalidos")
  	Return .T.
  EndIF
  // insira aqui o código para pesquisa do parametro recebido
  cCodUser := ::aURLParms[1]
  
  oDaoAprovador := UYDAOAprovador():New()
  oAprovador := oDaoAprovador:GetAprovador(cCodUser)
  
  IF ValType(oAprovador) == "O" .And. oAprovador:GetcClassName() == "UYAPROVADOR"
  
	  //Serializo o Objeto para a String em formato JSon
	  cJson := FWJsonSerialize(oAprovador,.T.,.T.)
	   // exemplo de retorno de um objeto JSON
	  ::SetResponse(cJson)
  Else
//  	SetRestFault(001,STR0001)
  EndIf
   
Else
	//   SetRestFault(001,STR0001)
EndIf

RestArea(aArea)

Return .T.
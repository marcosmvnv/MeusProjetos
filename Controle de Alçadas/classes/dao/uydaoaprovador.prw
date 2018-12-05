#Include "Totvs.ch"
#Include 'FWMVCDef.ch'

STATIC cOperID:= 	"000"	// Variavel para armazenar a operação que foi executada
 
#DEFINE OP_LIB   	"001" 	//Liberado
#DEFINE OP_EST   	"002" 	//Estornar
#DEFINE OP_SUP   	"003" 	//Superior
#DEFINE OP_TRA   	"004" 	//Transferir Superior
#DEFINE OP_EST		"005" 	// Estorno


/*/{Protheus.doc} UYDaoAprovador
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 01/11/2018
@version 1.0
@return ${return}, ${return_description}

@type class
/*/
Class UYDaoAprovador From UYObject
	//Construtor
	Method New() Constructor
	
	//Lista Pedidos do Aprovador
	Method ListaPedidos(oFilter)
	
	//Aprova Pedido de Compra
	Method AprovarPedido(oPedido)
	
	//Reprova Pedido de Compra
	Method ReprovarPedido(oPedido)
	//Retorna Objeto Aprovador com base no código de Usuario em parâmetro
	Method GetAprovador(cCodUser)
	//Bloquear Pedido de Venda
	Method BloquearPedido(oPedido)
EndClass

Method New() Class UYDaoAprovador
	_Super:New()
Return Self


/*/{Protheus.doc} GetAprovador
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 20/11/2018
@version 1.0
@return ${return}, ${return_description}
@param cCodUser, characters, description
@type function
/*/
Method GetAprovador(cCodUser) Class UYDaoAprovador
Local oAprovador
Local aArea	:= GetArea()

IF ValType(cCodUser) == "C"
	
	DbSelectArea("SAK")
	SAK->(DbSetOrder(2))
	IF SAK->(MsSeek(xFilial("SAK") + cCodUser))
		oAprovador 	:= UYAprovador():New()
		oAprovador:SetcId(SAK->AK_COD)
		oAprovador:SetnMoeda(SAK->AK_MOEDA)
		oAprovador:SetnLimite(SAK->AK_LIMITE)
		oAprovador:SetcTipo(SAK->AK_TIPO)
		oAprovador:SetcAproSup(SAK->AK_APROSUP)	
		oAprovador:SetnLimMin(SAK->AK_LIMMIN)
		oAprovador:SetnLimMax(SAK->AK_LIMMAX)			
		oAprovador:GetoUsuario():SetcId(SAK->AK_USER)
	EndIF	
EndIF

RestArea(aArea)
Return oAprovador



/*/{Protheus.doc} ListaPedidos
//TODO Lista Pedidos de Venda
@author Marcos Vieira
@since 20/11/2018
@version 1.0
@return ${return}, ${return_description}
@param oFilter, object, description
@type function
/*/
Method ListaPedidos(oFilter) Class UYDaoAprovador
Local oPedido
Local aPedidos 	:= {}
Local aAreaSCR 	:= SCR->(GetArea())
Local cAlias	:= GetNextAlias()
	
Default oFilter	:= UYFilterPedidos():New()

BeginSql Alias cAlias
	SELECT 	
		CR_EMISSAO,
		CR_NUM,
		CR_TIPO,
		CR_APROV,
		CR_GRUPO,
		CR_STATUS,
		CASE 
			WHEN CR_STATUS = '01'
				THEN 'Bloqueado p/ sistema (aguardando outros niveis) '
			WHEN CR_STATUS = '02'
				THEN 'Liberacao do usuario'
			WHEN CR_STATUS = '03'
				THEN 'Liberado pelo usuario'
			WHEN CR_STATUS = '04'
				THEN 'Bloqueado pelo usuario'
			WHEN CR_STATUS = '05'
				THEN 'Liberado por outro usuario'
			END CR_LEGENDA,
			CR_OBS,		
			CR_DATALIB
	FROM %Table:SCR% SCR
	WHERE
		SCR.%NotDel%																								AND 		
		SCR.CR_APROV = %Exp:oFilter:GetcIdSAK()% 																	AND
		SCR.CR_NUM	 	BETWEEN %Exp:oFilter:GetcIdSC7Ini()% 			AND %Exp:oFilter:GetcIdSC7Fim()% 			AND 	
		SCR.CR_STATUS 	BETWEEN %Exp:oFilter:GetcIniStatus()% 			AND %Exp:oFilter:GetcFimStatus()% 			AND
		SCR.CR_EMISSAO 	BETWEEN %Exp: DToS(oFilter:GetdIniEmissao())% 	AND %Exp: DToS(oFilter:GetdFimEmissao())% 	AND
		SCR.CR_DATALIB 	BETWEEN %Exp: DToS(oFilter:GetdIniDataLib())% 	AND %Exp: DToS(oFilter:GetdFimDataLib())% 			
		
EndSql

(cAlias)->(DbGoTop())

While !(cAlias)->(EoF())
	oPedido := UYPedidoCompra():New()
	oPedido:SetdEmissao((cAlias)->CR_EMISSAO)
	oPedido:SetcId((cAlias)->CR_NUM)
	oPedido:SetcTipo((cAlias)->CR_TIPO)
	oPedido:SetcAprov((cAlias)->CR_APROV)
	oPedido:SetcGrupo((cAlias)->CR_GRUPO)
	oPedido:SetcStatus((cAlias)->CR_STATUS)
	oPedido:SetcLegenda((cAlias)->CR_LEGENDA)
//	oPedido:SetcObs((cAlias)->CR_OBS)
	oPedido:SetdDataLib((cAlias)->CR_DATALIB)
	
	AAdd(aPedidos, oPedido)	
	(cAlias)->(DbSkip())
End

DbSelectArea(cAlias)
(cAlias)->(DbCloseArea())

SCR->(RestArea(aAreaSCR))

Return aPedidos


/*/{Protheus.doc} AprovarPedido
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 21/11/2018
@version 1.0
@return ${return}, ${return_description}
@param oPedido, object, description
@type function
/*/
Method AprovarPedido(oPedido) Class UYDaoAprovador
Local aArea		:= GetArea()
Local aArea		:= GetArea()
Local aAreaSCR	:= SCR->(GetArea())
Local aAreaSC7	:= SC7->(GetArea())
Local aAreaSAL	:= SAL->(GetArea())
Local cTipo		:= "PC"
Local aRotina	:= StaticCall(Mata094, MenuDef)
Local oModel	:= StaticCall(Mata094, ModelDef)
Local lRet		:= .T.

DbSelectArea("SCR")
SCR->(DbSetOrder(1))

IF SCR->(MsSeek(xFilial("SCR") + cTipo + oPedido:GetcId()))
	cOperID	:= OP_LIB
	FWExecView ("Aprovação de Documentos", "MATA094", MODEL_OPERATION_UPDATE ,/*oDlg*/ , {||.T.},/*bOk*/ ,/*nPercReducao*/ ,/*aEnableButtons*/ , /*bCancel*/ , /*cOperatId*/ ,/*cToolBar*/,/*oModelAct*/)//"Superior"
Else
	ConOut("Pedido de Compra não encontrado!")
	lRet := .F.
EndIF


SAL->(RestArea(aAreaSAL))
SC7->(RestArea(aAreaSC7))
SCR->(RestArea(aAreaSCR))
RestArea(aArea)
Return lRet

Method ReprovarPedido(oPedido) Class UYDaoAprovador

Return lRet

Method BloquearPedido(oPedido) Class UYDaoAprovador
Local lRet 		:= .T.
Local aAreaSCR	:= SCR->(GetArea())

DBSelectArea("SCR")

SCR->(DbSetOrdeR(1))

IF SCR->( MsSeek(xFilial("SCR") + cTipo + oPedido:GetcId()))
	If SCR->CR_STATUS $ "02"
		A097ProcLib(SCR->(Recno()),6)
	Else
		Help(" ",1,"A097BLOQ")  //Não é possivel bloquear o documento selecionado.  
		lRet := .F.
	EndIf
Else
	ConOut("Pedido de Venda não encontrado")
EndIF
SCR->(RestArea(aAreaSCR))
Return lRet
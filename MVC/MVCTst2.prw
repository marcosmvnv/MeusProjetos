#Include 'Protheus.ch'
#Include 'FWMVCDEF.ch'


User Function MVCTst2()
Local oBrowse
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("SB1")
	oBrowse:SetDescription("PRODUTO vs Compras Realizadas")
	oBrowse:Activate()

Return

Static Function MenuDef()
Local aRotina := {}
	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'StaticCall(MVCTst2, TstMsgRun)' OPERATION 2 ACCESS 0
	//ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC2' OPERATION 3 ACCESS 0
	//ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC2' OPERATION 4 ACCESS 0
	//ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVC2' OPERATION 5 ACCESS 0
	//ADD OPTION aRotina TITLE 'Imprimir'   ACTION 'VIEWDEF.MVC02' OPERATION 8 ACCESS 0
	//ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.MVC02' OPERATION 9 ACCESS 0
	
Return aRotina


Static Function ModelDef()
Local oModel
Local oStruSB1	:= FWFormStruct(1,"SB1")
Local oStruSD2	:= FWFormStruct(1,"SD2")

	oModel	:= MPFormModel():New("MVC2")
	oModel:SetDescription("PRODUTOs vs Vendas realizadas")
	
	//Adicionando formulario Pai
	oModel:addFields("MASTER_SB1",,oStruSB1)
	
	//Adicionando formulario(s) Filho(s)
	oModel:addGrid("DETAIL_SD2","MASTER_SB1", oStruSD2)
	
	oModel:SetPrimaryKey({'B1_FILIAL','B1_COD'})
	//Setando a descrição dos modelos
	oModel:getModel("MASTER_SB1"):SetDescription("PRODUTOS")
	oModel:getModel("DETAIL_SD2"):SetDescription("Compras realizadas")
	
	//Setando a relação pai e filha
	oModel:SetRelation("DETAIL_SD2", ;       
 					{{"D2_FILIAL",'xFilial("SD2")'	},; 					 					
 					{"D2_COD"	,"B1_COD"}},;
 					SD2->(IndexKey(1)))
 					 						
Return oModel

Static Function ViewDef()
Local oView
Local oModel 	:= ModelDef()
Local oStruSB1	:= FWFormStru(2,"SB1")
Local oStruSD2	:= FWFormStru(2,"SD2")
	
	//Removendo exibição de campos 
	 //oStruSD2:RemoveField('TAB_CAMPO')
	 
	 oView	:= FWFormView():New()
	 oView:SetModel(oModel)
	 oView:AddField("FORM_PRODUTOS"	, oStruSB1,"MASTER_SB1")
	 oView:AddGrid("FORM_VENDAS"	, oStruSD2,"DETAIL_SD2")
	 
	 oView:CreateHorizontalBox("BOX_FORM_CABEC"	,60)
	 oView:CreateHorizontalBox("BOX_FORM_ITENS"	,40)
	 
	 oView:SetOwnerView("FORM_PRODUTOS"	,"BOX_FORM_CABEC")
	 oView:SetOwnerView("FORM_VENDAS"	,"BOX_FORM_ITENS")
	 
	 
Return oView

/*/{Protheus.doc} TstMsgRun
//TODO Descrição auto-gerada.
@author totvs
@since 12/09/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
Static Function TstMsgRun()

If FindFunction("FWMsgRun")
	FWMsgRun(, {|oSay| ExecTest() }, "Procesando", "Procesando datos...")
ElseIf FindFunction("Processa")
	Processa( {|oSay|  ExecTest() }, "Procesando", "Procesando datos...")
Return

/*/{Protheus.doc} ExecTest
//TODO Descrição auto-gerada.
@author totvs
@since 12/09/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
Static Function ExecTest()
FWExecView('Inclusao por FWExecView','MVCTst2')
Return
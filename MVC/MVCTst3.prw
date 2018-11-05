#include "Protheus.ch"
#include "FWMVCDEF.ch"

User Function MVCTst3()
Local oBrowse

	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("SB1")
	oBrowse:SetDescription("Produtos")
	oBrowse:Activate()
Return

Static Function MenuDef()
Local aRotina := {}
	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'StaticCall(MVCTst3, TstMsgRun)' OPERATION 2 ACCESS 0

Return aRotina

Static Function ModelDef()
Local oModel
Local oStrucSB1	:= FWFormStruct(1,"SB1")
Local oStrucSD1	:= FWFormStruct(1,"SD1")
Local oStrucSD2	:= FWFormStruct(1,"SD2")

	oModel	:= MPFormModel():New("_MVCTst3")
	oModel:SetDescription("Análise Produtos")
	
	//Form Pai
	oModel:addFields("MASTER_SB1", ,oStrucSB1)
	
	//Forms Filhos
	oModel:addGrid("DETAIL_SD1","MASTER_SB1",oStrucSD1)
	oModel:addGrid("DETAIL_SD2","MASTER_SB1",oStrucSD2)
	
	oModel:SetPrimaryKey({'B1_FILIAL','B1_COD'})
	
	oModel:getModel("MASTER_SB1"):SetDescription("Produtos")
	oModel:getModel("DETAIL_SD1"):SetDescription("Compras realizadas")
	oModel:getModel("DETAIL_SD2"):SetDescription("Vendas realizadas")
	
	//Setando a relação pai e filha
	oModel:SetRelation("DETAIL_SD2", ;       
 					{{"D2_FILIAL"	,'xFilial("SD2")'	},; 					 					
 					 {"D2_COD"		,"B1_COD"			} ;
 					},SD2->(IndexKey(1)))
 	
 	oModel:SetRelation("DETAIL_SD1", ;       
 					{{"D1_FILIAL"	,'xFilial("SD1")'	},; 					 					
 					 {"D1_COD"		,"B1_COD"			} ;
 					},SD1->(IndexKey(1)))
 					
Return oModel

Static Function ViewDef()

Local oModel 	:= ModelDef()
Local oStrucSB1	:= FWFormStru(2,"SB1")
Local oStrucSD1	:= FWFormStru(2,"SD1")
Local oStrucSD2	:= FWFormStru(2,"SD2")

	oView	:= FWFormView():New()
	oView:SetModel(oModel)
	
	oView:addField("FORM_SB1",oStrucSB1,"MASTER_SB1")
	oView:addGrid("FORM_SD1" ,oStrucSD1,"DETAIL_SD1")
	oView:addGrid("FORM_SD2" ,oStrucSD2,"DETAIL_SD2")
	
	oView:CreateHorizontalBox("BOX_FORM_SB1"	,60)
	oView:CreateHorizontalBox("BOX_FORM_SD1"	,20)
	oView:CreateHorizontalBox("BOX_FORM_SD2"	,20)
	
	oView:SetOwnerView("FORM_SB1","BOX_FORM_SB1")
	oView:SetOwnerView("FORM_SD1","BOX_FORM_SD1")
	oView:SetOwnerView("FORM_SD2","BOX_FORM_SD2")
	
Return oView

Static Function TstMsgRun()

	If FindFunction("FWMsgRun")
		FWMsgRun(, {|oSay| ExecTest() }, "Procesando", "Procesando datos...")
	ElseIf FindFunction("Processa")
		Processa( {|oSay|  ExecTest() }, "Procesando", "Procesando datos...")
	EndIF
Return

Static Function ExecTest()
	FWExecView('Inclusao por FWExecView','MVCTst3')
Return
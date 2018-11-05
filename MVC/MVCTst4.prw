#include "Protheus.ch"
#include "FWMVCDef.ch"

User Function MVCTst4()
Local oBrowse
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("SF1")
	oBrowse:SetDescription("Notas Entrada 04")
	oBrowse:Activate()
Return

Static Function MenuDef()
Local aRotina := {}

	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.MVCTst4" 	OPERATION 2 ACCESS 0
Return aRotina

Static Function ModelDef()
Local oModel
Local oStrucSF1	:= FWFormStruct(1,"SF1")
Local oStrucSD1	:= FWFormStruct(1,"SD1")

	oModel	:= MPFormModel():New("zMVCTst4")
	oModel:SetDescription("Notas de entrada")
	
	oModel:AddFields("MASTER_SF1", ,oStrucSF1)
	
	oModel:AddGrid("DETAIL_SD1","MASTER_SF1",oStrucSD1)
	
	oModel:getModel("MASTER_SF1"):SetDescription("Cabeçalho Notas de entrada")
	oModel:getModel("DETAIL_SD1"):SetDescription("Itens Notas de entrada")
	
	oModel:SetRelation("DETAIL_SD1",{	{"D1_FILIAL"	,"xFilial('SD1')"}	,;
										{"D1_SERIE"		,"F1_SERIE"}		,;
										{"D1_DOC"		,"F1_DOC"}			,;
										{"D1_FORNECE"	,"F1_FORNECE"}		,;
										{"D1_LOJA"		,"F1_LOJA"}			 ;
									},SD1->(IndexKey()))										
Return oModel

Static Function ViewDef()
Local oView
Local oModel	:= ModelDef()
Local oStrucSF1	:= FWFormStruct(2,"SF1")
Local oStrucSD1	:= FWFormStruct(2,"SD1")

	oView	:= FWFormView():New()
	oView:SetModel(oModel)
	
	oView:addField("FORM_SF1",oStrucSF1,"MASTER_SF1")
	oView:addGrid("FORM_SD1",oStrucSD1,"DETAIL_SD1")
	
	oView:CreateHorizontalBox("BOX_SF1",40)
	oView:CreateHorizontalBox("BOX_SD1",60)
	
	oView:SetOwnerView("FORM_SF1","BOX_SF1")
	oView:SetOwnerView("FORM_SD1","BOX_SD1")

Return oView
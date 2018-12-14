#include "Totvs.ch"

/*/{Protheus.doc} AJUCLVL
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/12/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
User Function AJUCLVL()
Local cCodEmp	:= "99"
Local cCodFil	:= "01"
Local cEnvUser	:= "admin" 
Local cEnvPass	:= "admin"
Local cEnvMod	:= "CTB"
Local cFunName	:= "AJUCLVL"
Local aTables	:= {"CTH"} 
Local lShowFinal:= .F.
Local lAbend	:= .T.
Local lOpenSX	:= .T.
Local lConnect	:= .T.
Local lConectou	:= .F.
Local lRotAuto	:= .F.
Local oDlg 	
Local oBrowse

Local cAlias 	:= GetNextAlias()

IF Select("SX3") == 0
	RpcSetType(3)
	//lConectou := RpcSetEnv(cCodEmp, cCodFil, cEnvUser, cEnvPass, cEnvMod, cFunName, aTables, lShowFinal, lAbend, lOpenSX, lConnect)
	lRotAuto	:= lConectou := RpcSetEnv(cCodEmp)
Else
	lConectou := .F.
EndIF

IF lConectou
//	oDlg := MSDialog():New(180,180,550,700,'Ajuste Classe Valor',,,,,CLR_BLACK,CLR_WHITE,,,.T.)
	DEFINE DIALOG oDlg TITLE "Exemplo BrGetDDB" FROM 280, 280 TO 750, 900 PIXEL   	 
		AjustaCLVL(@cAlias)
		oBrowse := BrGetDDB():new( 50,1,260,184,,,,oDlg,,,,,,,,,,,,.F.,(cAlias),.T.,,.F.,,, )  		
		oBrowse:addColumn( TCColumn():new( 'Nome'			, { || (cAlias)->NOME }	,,,, 'LEFT',, .F., .F.,,,, .F. ) )
		oBrowse:addColumn( TCColumn():new( 'Clase Valor'	, { || (cAlias)->CLVL }	,,,, 'LEFT',, .F., .F.,,,, .F. ) )
		
 
  ACTIVATE DIALOG oDlg CENTERED

  IF lRotAuto
  	RpcClearEnv()
  EndIF
	
EndIF
Return

/*/{Protheus.doc} AjustaCLVL
//TODO Descrição auto-gerada.
@author Marcos Vieira
@since 14/12/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
Static Function AjustaCLVL(cAlias)
Local oCLVL
Local oDAOCLVL
Local cMsg		:= ""
Local nCount	:= 0
Local cClSupSA2	:= "8"
Local nReg		:= 0
Local lInsert	:= .T.

BeginSQL Alias cAlias
	SELECT 		
		SA2.NOME,
		SA2.CLVL
	FROM (
	SELECT 
	   		'SA2' 					AS TAB,
	   		('8'+ A2_COD + A2_LOJA) AS CLVL,
	  		A2_NOME 				AS NOME
		FROM %Table:SA2%
		WHERE %NotDel%  
		
	)SA2
	LEFT JOIN (
		SELECT 
			'CTH' 		AS TAB,
			CTH_CLVL 	AS CLVL
		FROM %Table:CTH% 
		WHERE 
			%NotDel% AND 		
			SUBSTRING(CTH_CLVL,1,1) = %Exp:cClSupSA2% AND 
			LEN( RTRIM(CTH_CLVL)) = 9
	) CTH
	ON CTH.CLVL = SA2.CLVL	
	WHERE CTH.TAB IS NULL
	ORDER BY SA2.CLVL
EndSQL

Count To nReg

IF !isBlind()
	IF IFMsgYesNo(cValToChar(nReg)+" inconssistencias encontradas. Deseja inclui-las?", "Aviso")
		
	Else
		lInsert := .F.
	EndIF
Else
	ConOut(cValToChar(nReg) + " registros encontrados.")
EndIF

IF lInsert
	DBSelectArea("CTH")
	CTH->(DbSetOrder(1))
	
	(cAlias)->(DbGoTop())
	
	While !(cAlias)->(Eof())
		IF !CTH->(MsSeek(xFilial("CTH") + (cAlias)->CLVL ))	
			oCLValor := UYCGClasseValor():New()
			
			oCLValor:SetcClasse("2") 		//Tipo Classe Valor -> 2=Sintetico; 1=Analitico
			oCLValor:SetcClVl((cAlias)->CLVL)
			oCLValor:SetcBloq("2")			//Bloqueado?				
			oCLValor:SetcClSup(cClSupSA2)			
			oCLValor:SetcDesc01((cAlias)->NOME)
					
			oDAOCLVL := UYCGDAOClasseValor():New()
			
			IF oDAOCLVL:Insert(oCLValor)
				nCount++
			Else
				cMsg += "Falha ao incluir Clase Valor ->"+ oCLValor:GetcClVl() + Chr(10) + Chr(15)
			EndIF
			
			oDAOCLVL:Destroy()
			oCLValor:Destroy()
		EndIF
		
		(cAlias)->(DbSkip())
	End
	
	IF Select(cAlias) > 0
		DbSelectArea(cAlias)
		(cAlias)->(DbCloseArea())
	EndIF
	
	IF !Empty(cMsg)
		MsgInfo(cMsg)
		conOut(cMsg)
	Else
		MsgInfo("Registros incluídos com sucesso. Total de Reg incluídos:" + cValTocHar(nCount))
		conOut("Registros incluídos com sucesso. Total de Reg incluídos:" + cValTocHar(nCount))
	EndIF
EndIF
Return
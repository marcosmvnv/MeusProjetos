#include "Totvs.ch"

Static aTpValido := {"1","2","3","4","5","6","7","8","9","0"}
Static aConstant := {"2","9","8","7","6","3","4"}
/*/{Protheus.doc} UYVldCI
//TODO Descrição Function para validar a Cédula Uruguaya
@author Marcos Vieira
@since 05/12/2018
@version 1.0
@return ${return}, ${return_description}
@param cCI, characters, description
@type function
/*/
User Function UYVldCI(cCI)
Local nCount		:= 0
Local lAuto 		:= isBlind()
Local nI			:= 0
Local nS			:= 0
Local nM			:= 0
Local nH			:= 0
Local cDgtoVerif	:= ""
Local aMsgSoluc		:= {}
Local cMsgError		:= ""

//Validando Tipo de Dado em parametro
IF ValType(cCI) <> "C"
	cMsgError := "Tipo de dato incorrecto"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+cMsgError)
	Else	
		aAdd(aMsgSoluc, "El parametro desta function necesita ser del tipo Caracter")					
		Help( , , "UYVldCI_A", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)
	EndIF
	Return .F.
EndIF

//Removo digitos separadores se existirem
cCI := StrTran(cCI, "-","")
cCI := StrTran(cCI, ".","")
cCI := StrTran(cCI, ",","")
cCI := Alltrim(cCI)

If Empty(cCI)
	Return .F.
EndIF

//Validando Tamanho do CI (poderá ser de 7 a 8 caracteres até o momento)
IF Len(cCI) <> 8 
	cMsgError := "Nª de CI inválido"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|Tamanho do Numero de CI informado inválido")
	Else
		aAdd(aMsgSoluc, "Verifique se el conteudo de la pregunta 'Tipo Documento' (A1_TP) en la carpeta 'Otros' esta como CI y se el numero digitado esta correcto")
		Help( , , "UYVldCI_B", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)
	EndIF
	Return .F.
EndIf

//Valido se os tipos de dados sao validos 
For nI:= 1 To Len(cCI)
	IF aScan(aTpValido, {|x| x == Substr(cCI,nI,1) }) == 0
		nCount++
	EndIf
Next

IF nCount > 0
	cMsgError := "Nª de CI inválido"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|CI: "+ cCI + "possui dados caracteres que nao sao validos")
	Else
		aAdd(aMsgSoluc, "Verifique se el conteudo de la pregunta 'Tipo Documento' (A1_TP) en la carpeta 'Otros' esta como CI y se el numero digitado esta correcto")
		Help( , , "UYVldCI_C", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)	
	EndIF
	Return .F.
EndIF

//Pego o Digito Verificador informado
cDigtVerif := Substr(cCI,Len(cCI),1)

//Pego o CI sem o digito verificador
cCI := Substr(cCI,1,Len(cCI)-1)

For nI:=1 To Len(cCI)
	nS += Val(Substr(cCI,nI,1))* Val(aConstant[nI])
Next

nM := Mod(nS, 10)

nH := Mod( (10-nM), 10)

IF nH <> Val(cDigtVerif)
	cMsgError := "Nª de CI inválido"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|CI: "+ cCI + "Digito verificador invalido. "+"Digito verificador calculado: "+ cValToChar(nH)+;
		" Dgto Verif informado: "+ cDigtVerif)
	Else
		aAdd(aMsgSoluc, "Verifique se el conteudo de la pregunta 'Tipo Documento' (A1_TP) en la carpeta 'Otros' esta como CI y se el numero digitado esta correcto")
		Help( , , "UYVldCI_D", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)		
	EndIF
	Return .F.	
EndIF

Return .T.
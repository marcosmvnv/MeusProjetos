#include "Totvs.ch"

Static aTpValido := {"1","2","3","4","5","6","7","8","9","0","K"}

/*/{Protheus.doc} UYVldRUT
//TODO Descrição Function para validar N de RUT.
@author Marcos Vieira
@since 05/12/2018
@version 1.0
@return ${return}, ${return_description}
@param cRut, characters, Numero de RUT a ser validado
@type function
/*/
User Function UYVldRUT(cRut)
Local nDc		:= ""
Local nTotal	:= 0
Local nFactor	:= 0
Local nDv 		:= 0
Local nI		:= 0
Local lAuto		:= isBlind()
Local nCount	:= 0
Local aMsgSoluc	:= {}
Local cMsgError	:= ""

IF ValType(cRut) <> "C"
	cMsgError := "Tipo de dato incorrecto"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+cMsgError)
	Else
		aAdd(aMsgSoluc, "El parametro desta function necesita ser del tipo Caracter")		
		Help( , , "UYVldRUT_A", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)
	EndIF
	Return .F.
EndIf

//Removo digitos separadores se existirem
cRut := StrTran(cRut, "-","")
cRut := StrTran(cRut, ".","")
cRut := StrTran(cRut, ",","")
cRut := Alltrim(cRut)

If Empty(cRut)
	Return .F.
EndIF

If Len(cRut) <> 12
	cMsgError := "Nª de RUT inválido"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|Tamanho de RUT: "+ cRut + "Inválido")
	Else
		aAdd(aMsgSoluc, "Verifique se el conteudo de la pregunta 'Tipo Documento' (A1_TP) en la carpeta 'Otros' esta como RUT y se el numero digitado esta correcto")		
		Help( , , "UYVldRUT_B", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)
	EndIF
	Return .F.
EndIF

For nI:= 1 To Len(cRut)
	IF aScan(aTpValido, {|x| x == Substr(cRut,nI,1) }) == 0
		nCount++
	EndIf
Next

IF nCount > 0
	cMsgError := "Nª de RUT inválido"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|RUT: "+ cRut + "Inválido")
	Else
		aAdd(aMsgSoluc, "Verifique se el conteudo de la pregunta 'Tipo Documento' (A1_TP) en la carpeta 'Otros' esta como RUT y se el numero digitado esta correcto")		
		Help( , , "UYVldRUT_C", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)
	EndIF
	Return .F.
EndIF

nDc 	:= Val(substr(cRut,12, 1))
cRut 	:= substr(cRut,1, 11)
nFactor	:= 2

For nI:= 11 To 1 Step -1
	nTotal += (nFactor * Val(substr(cRut, nI, 1)))
	IF nFactor == 9
		nFactor := 2
	Else
		++nFactor
	EndIf
Next 
 
nDv := 11 - ( Mod(nTotal, 11) )
 
If (nDv == 11)
	nDv := 0
ElseIF (nDv == 10)
	nDv := 1
EndIf

If (nDv <> nDc)
	cMsgError := "Nª de RUT inválido"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|RUT: "+ cRut + "Inválido")
	Else
		aAdd(aMsgSoluc, "Verifique se el conteudo de la pregunta 'Tipo Documento' (A1_TP) en la carpeta 'Otros' esta como RUT y se el numero digitado esta correcto")		
		Help( , , "UYVldRUT_D", , cMsgError, 1, 0, NIL, NIL, NIL, NIL, NIL, aMsgSoluc)
	EndIF
	Return .F.
EndIf

Return .T.
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
Local nDc	:= ""
Local nTotal:= 0
Local nFactor:= 0
Local nDv 	:= 0
Local nI	:= 0
Local lAuto	:= isBlind()
Local nCount:= 0

IF ValType(cRut) <> "C"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|Tipo de dado inválido")
	Else
		Alert("Tipo de dado inválido")
	EndIF
	Return .F.
EndIf

//Removo digitos separadores se existirem
cRut := StrTran(cRut, "-","")
cRut := StrTran(cRut, ".","")
cRut := StrTran(cRut, ",","")

If Len(cRut) <> 12
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|Tamanho de cRut: "+ cRut + "Inválido")
	Else
		Alert("cRut Digitado inválido!")
	EndIF
	Return .F.
EndIF

For nI:= 1 To Len(cRut)
	IF aScan(aTpValido, {|x| x == Substr(cRut,nI,1) }) == 0
		nCount++
	EndIf
Next

IF nCount > 0
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|RUT: "+ cRut + "Inválido")
	Else
		Alert("RUT inválido!")
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
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|RUT: "+ cRut + "Inválido")
	Else
		Alert("Nº RUT inválido!")
	EndIF
	Return .F.
EndIf

Return .T.
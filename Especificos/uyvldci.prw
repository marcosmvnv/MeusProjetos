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

Default cCI 	:= ""

//Validando Tipo de Dado em parametro
IF ValType(cCI) <> "C"
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|Tipo de dado inválido")
	Else
		Alert("Tipo de dado inválido")
	EndIF
	Return .F.
EndIF

//Removo digitos separadores se existirem
cCI := StrTran(cCI, "-","")
cCI := StrTran(cCI, ".","")
cCI := StrTran(cCI, ",","")
cCI := Alltrim(cCI)
//Validando Tamanho do CI (poderá ser de 7 a 8 caracteres até o momento)
IF Len(cCI) <> 8 
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|Tamanho do Numero de CI informado inválido")
	Else
		Alert("Nº de CI invalido")
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
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|CI: "+ cCI + "possui dados caracteres que nao sao validos")
	Else
		Alert("CI inválido!")
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
	IF lAuto
		ConOut(FunName()+DToC(dDataBase)+Time()+"|CI: "+ cCI + "Digito verificador invalido. "+"Digito verificador calculado: "+ cValToChar(nH)+;
		" Dgto Verif informado: "+ cDigtVerif)
	Else
		Alert("CI inválido!")
	EndIF
	Return .F.	
EndIF

Return .T.
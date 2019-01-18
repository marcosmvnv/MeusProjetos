#include "totvs.ch"

/*/{Protheus.doc} UYSX3Cbx
Retorna el texto con la descripción de la opcion informada en el campo tipo combo
@author Rodrigo Godinho
@since 12/07/2018
@version 1.0
@param cCampo, characters, Nombre del campo
@param cOpcion, characters, Opcion informada
@param cDefault, characters, Valor por defecto
@return characters, Texto con la descripción de la opcion informada en el campo tipo combo
@type function
/*/
User Function UYSX3Cbx(cCampo, cOpcion, cDefault)
Local cRet		:= ""
Local aArea		:= GetArea()
Local aItems	:= {}
Local aAux		:= {}
Local nI		:= 0

Default cCampo		:= "" 
Default cOpcion		:= ""
Default cDefault	:= ""

If ValType(cCampo) == "C" .And. !Empty(cCampo) .And. ValType(cOpcion) == "C" .And. !Empty(cOpcion)
	aItems := StrTokArr(GetSX3CBox(cCampo), ";")
	If ValType(aItems) == "A"
		For	nI := 1 To Len(aItems)
			If ValType(aItems[nI]) == "C"
				aAux := StrTokArr(aItems[nI], "=")
				If ValType(aAux) == "A" .And. Len(aAux) > 0
					If Upper(AllTrim(cOpcion)) == Upper(AllTrim(aAux[1]))
						If Len(aAux) > 1
							cRet := AllTrim(aAux[2])
						Else
							cRet := AllTrim(aAux[1])
						EndIf
						Exit
					EndIf
				EndIf
			EndIf
		Next
	EndIf
EndIf

Return cRet

/*/{Protheus.doc} GetSX3CBox
Trae el listado de opciones
@author Rodrigo Godinho
@since 12/07/2018
@version 1.0
@param cCampo, characters, Campo del diccionario
@return characters, String con el listado de opciones en el patron del configurador(SIGACFG) 
@type function
/*/
Static Function GetSX3CBox(cCampo)
Local cRet		:= ""
Local aArea		:= GetArea()
Local aAreaSX3	:= SX3->(GetArea())

Default cCampo	:= ""

If ValType(cCampo) == "C" .And. !Empty(cCampo)
	SX3->(dbSetOrder(2))
	If SX3->(dbSeek( cCampo ))
		cRet := AllTrim(X3Cbox())
	EndIf
EndIf
 
SX3->(RestArea(aAreaSX3))
RestArea(aArea)
Return cRet
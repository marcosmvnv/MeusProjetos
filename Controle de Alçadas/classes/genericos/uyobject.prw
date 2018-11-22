#include "Totvs.ch"

Class UYObject
	Method New() Constructor
	Method cGetClassName()
	Method Destroy()
EndClass

Method New() Class UYObject
Return self

Method cGetClassName() Class UYObject
Return "UYOBJECT"

Method Destroy() Class UYObject
IF Self != Nil
	FreeObj(Self)
	Self := Nil
EndIf
Return
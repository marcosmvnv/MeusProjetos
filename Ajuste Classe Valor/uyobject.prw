#include "totvs.ch"

CLASS UYObject FROM LongNameClass
	METHOD New() CONSTRUCTOR
	METHOD GetcClassName()
	METHOD ToString()
	METHOD Destroy()
ENDCLASS

METHOD New() CLASS UYObject
Return

METHOD GetcClassName() CLASS UYObject
Return "UYOBJECT"

METHOD ToString() CLASS UYObject
Return ""

METHOD Destroy() CLASS UYObject
If(self != nil)
	FreeObj(self)
	self := nil
EndIf
Return
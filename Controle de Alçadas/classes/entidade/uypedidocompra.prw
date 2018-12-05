#include "Totvs.ch"

CLASS UYPedidoCompra FROM UYObject
	//Atributos
	Data cFil
	Data cId
	Data dEmissao
	Data oFornecedor
	Data oCondPg
	Data cContato
	Data cFilEntrega
	Data nMoeda
	Data nTaxa
	Data cNatureza
	Data cTipo
	Data cAprov
	DAta cGrupo
	Data cStatus
	Data cLegenda
	Data cObs
	Data dDataLib
	//Constructor
	METHOD New(cFil,cId,dEmissao,oFornecedor,oCondPg,cContato,cFilEntrega,nMoeda,nTaxa,cNatureza, cTipo,cAprov	,cGrupo	,cStatus,cLegenda,cObs,dDataLib) Constructor	
	//Getters
	METHOD GetcFil()
	METHOD GetcTipo()
	METHOD GetcId()
	METHOD GetdEmissao()
	METHOD GetoFornecedor()
	METHOD GetoCondPg()
	METHOD GetcContato()
	METHOD GetcFilEntrega()
	METHOD GetnMoeda()
	METHOD GetnTaxa()
	METHOD GetcNatureza()
	METHOD GetcAprov()
	METHOD GetcGrupo()
	METHOD GetcStatus()
	METHOD GetcLegenda()
	METHOD GetcObs()
	METHOD GetdDataLib()
	//Setters
	METHOD SetcFil(cFil)
	METHOD SetcTipo(cTipo)
	METHOD SetcID(cId)
	METHOD SetdEmissao(dEmissao)
	METHOD SetoFornecedor(oFornecedor)
	METHOD SetoCondPg(oCondPg)
	METHOD SetcContato(cContato)
	METHOD SetcFilEntrega(cFilEntrega)
	METHOD SetnMoeda(nMoeda)
	METHOD SetnTaxa(nTaxa)
	METHOD SetcNatureza(cNatureza)
	
	METHOD SetcAprov(cAprov)
	METHOD SetcGrupo(cGrupo)
	METHOD SetcStatus(cStatus)
	METHOD SetcLegenda(cLegenda)
	METHOD SetcObs(cObs)
	METHOD SetdDataLib(dDataLib)
	//Especificos
	METHOD GetcClassName()
ENDCLASS

METHOD New(cFil,cId,dEmissao,oFornecedor,oCondPg,cContato,cFilEntrega,nMoeda,nTaxa,cNatureza, cTipo, cAprov	,cGrupo	,cStatus,cLegenda,cObs,dDataLib) Class UYPedidoCompra
Default cFil		:= xFilial("SCR")
Default cId			:= ""
Default dEmissao	:= CToD("")
Default cTipo		:= "PC"
//Default oFornecedor	
//Default oCondPg		
Default cContato	:= ""
Default cFilEntrega	:= xFilial("SCR")
Default nMoeda		:= 0
Default nTaxa		:= 0
Default cNatureza	:= ""
Default cAprov		:= ""
Default cGrupo		:= ""
Default cStatus		:= ""
Default cLegenda	:= ""
Default cObs		:= ""
Default dDataLib	:= CToD("")
_Super:New()

Self:SetcFil(cFil)
Self:SetcID(cId)
Self:SetdEmissao(dEmissao)
Self:SetoFornecedor(oFornecedor)
Self:SetoCondPg(oCondPg)
Self:SetcContato(cContato)
Self:SetcFilEntrega(cFilEntrega)
Self:SetnMoeda(nMoeda)
Self:SetnTaxa(nTaxa)
Self:SetcNatureza(cNatureza)

Self:SetcAprov(cAprov)
Self:SetcGrupo(cGrupo)
Self:SetcStatus(cStatus)
Self:SetcLegenda(cLegenda)
Self:SetcObs(cObs)
Self:SetdDataLib(dDataLib)
Return Self

/********************METODOS GETTERS*******************/
METHOD GetcFil() Class UYPedidoCompra      
Return ::cFil

METHOD GetcTipo() Class UYPedidoCompra      
Return ::cTipo

METHOD GetcId() Class UYPedidoCompra      
Return ::cId

METHOD GetdEmissao() Class UYPedidoCompra      
Return ::dEmissao

METHOD GetoFornecedor() Class UYPedidoCompra      
Return ::oFornecedor

METHOD GetoCondPg() Class UYPedidoCompra      
Return ::oCondPg

METHOD GetcContato() Class UYPedidoCompra      
Return ::cContato

METHOD GetcFilEntrega() Class UYPedidoCompra      
Return ::cFilEntrega

METHOD GetnMoeda() Class UYPedidoCompra      
Return ::nMoeda

METHOD GetnTaxa() Class UYPedidoCompra      
Return ::nTaxa

METHOD GetcNatureza() Class UYPedidoCompra      
Return ::cNatureza

/*******************METODOS SETTERS*******************/
METHOD SetcFil(cFil) Class UYPedidoCompra      
IF ValType(cFil) == 'C' 
	::cFil := cFil
EndIf
Return

METHOD SetcTipo(cTipo) Class UYPedidoCompra      
IF ValType(cTipo) == 'C' 
	::cTipo := cTipo
EndIf
Return

METHOD SetcId(cId) Class UYPedidoCompra      
IF ValType(cId) == 'C' 
	::cId := cId
EndIf
Return

METHOD SetdEmissao(dEmissao) Class UYPedidoCompra      
IF ValType(dEmissao) == 'D' 
	::dEmissao := dEmissao
EndIf
Return

METHOD SetoFornecedor(oFornecedor) Class UYPedidoCompra      
IF ValType(oFornecedor) == 'O' 
	::oFornecedor := oFornecedor
EndIf
Return

METHOD SetoCondPg(oCondPg) Class UYPedidoCompra      
IF ValType(oCondPg) == 'O' 
	::oCondPg := oCondPg
EndIf
Return

METHOD SetcContato(cContato) Class UYPedidoCompra      
IF ValType(cContato) == 'C' 
	::cContato := cContato
EndIf
Return

METHOD SetcFilEntrega(cFilEntrega) Class UYPedidoCompra      
IF ValType(cFilEntrega) == 'C' 
	::cFilEntrega := cFilEntrega
EndIf
Return

METHOD SetnMoeda(nMoeda) Class UYPedidoCompra      
IF ValType(nMoeda) == 'N' 
	::nMoeda := nMoeda
EndIf
Return

METHOD SetnTaxa(nTaxa) Class UYPedidoCompra      
IF ValType(nTaxa) == 'N' 
	::nTaxa := nTaxa
EndIf
Return

METHOD SetcNatureza(cNatureza) Class UYPedidoCompra      
IF ValType(cNatureza) == 'C' 
	::cNatureza := cNatureza
EndIf
Return

/********************METODOS GETTERS*******************/
Method GetcAprov() Class UYPedidoCompra      
Return ::cAprov

Method GetcGrupo() Class UYPedidoCompra      
Return ::cGrupo

Method GetcStatus() Class UYPedidoCompra      
Return ::cStatus

Method GetcLegenda() Class UYPedidoCompra      
Return ::cLegenda

Method GetcObs() Class UYPedidoCompra      
Return ::cObs

Method GetdDataLib() Class UYPedidoCompra      
Return ::dDataLib

/*******************METODOS SETTERS*******************/
Method SetcAprov(cAprov) Class UYPedidoCompra      
IF ValType(cAprov) == 'C' 
	::cAprov := cAprov
EndIf
Return

Method SetcGrupo(cGrupo) Class UYPedidoCompra      
IF ValType(cGrupo) == 'C' 
	::cGrupo := cGrupo
EndIf
Return

Method SetcStatus(cStatus) Class UYPedidoCompra      
IF ValType(cStatus) == 'C' 
	::cStatus := cStatus
EndIf
Return

Method SetcLegenda(cLegenda) Class UYPedidoCompra      
IF ValType(cLegenda) == 'C' 
	::cLegenda := cLegenda
EndIf
Return

Method SetcObs(cObs) Class UYPedidoCompra      
IF ValType(cObs) == 'C' 
	::cObs := cObs
EndIf
Return

Method SetdDataLib(dDataLib) Class UYPedidoCompra      
IF ValType(dDataLib) == 'D' 
	::dDataLib := dDataLib
EndIf
Return


Method GetcClassName() Class UYPedidoCompra
Return "UYPedidoCompra"


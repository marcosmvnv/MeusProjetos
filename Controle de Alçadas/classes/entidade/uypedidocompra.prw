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
	//Constructor
	METHOD New(cFil,cId,dEmissao,oFornecedor,oCondPg,cContato,cFilEntrega,nMoeda,nTaxa,cNatureza) Constructor
	//Getters
	METHOD GetcFil()
	METHOD GetcId()
	METHOD GetdEmissao()
	METHOD GetoFornecedor()
	METHOD GetoCondPg()
	METHOD GetcContato()
	METHOD GetcFilEntrega()
	METHOD GetnMoeda()
	METHOD GetnTaxa()
	METHOD GetcNatureza()
	//Setters
	METHOD SetcFil(cFil)
	METHOD SetcID(cId)
	METHOD SetdEmissao(dEmissao)
	METHOD SetoFornecedor(oFornecedor)
	METHOD SetoCondPg(oCondPg)
	METHOD SetcContato(cContato)
	METHOD SetcFilEntrega(cFilEntrega)
	METHOD SetnMoeda(nMoeda)
	METHOD SetnTaxa(nTaxa)
	METHOD SetcNatureza(cNatureza)
	//Especificos
	METHOD GetcClassName()
ENDCLASS

METHOD New(cFil,cId,dEmissao,oFornecedor,oCondPg,cContato,cFilEntrega,nMoeda,nTaxa,cNatureza) Class UYPedidoCompra
Default cFil		:= xFilial("SCR")
Default cId			:= ""
Default dEmissao	:= CToD("")
Default oFornecedor	
Default oCondPg		
Default cContato	:= ""
Default cFilEntrega	:= xFilial("SCR")
Default nMoeda		:= 0
Default nTaxa		:= 0
Default cNatureza	:= ""

_Super:New()

//Self:SetcFil(cFil)
//Self:SetcID(cId)
//Self:SetdEmissao(dEmissao)
//Self:SetoFornecedor(oFornecedor)
//Self:SetoCondPg(oCondPg)
//Self:SetcContato(cContato)
//Self:SetcFilEntrega(cFilEntrega)
//Self:SetnMoeda(nMoeda)
//Self:SetnTaxa(nTaxa)
//Self:SetcNatureza(cNatureza)
Return Self

#include "Totvs.ch"

Class UYPedidoCompra From UYObject
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
	
	Method New() Constructor
	
	Method GetcFil()
	Method GetcId()
	Method GetdEmissao()
	Method GetoFornecedor()
	Method GetoCondPg()
	Method GetcContato()
	Method GetcFilEntrega()
	Method GetnMoeda()
	Method GetnTaxa()
	Method GetcNatureza()
	
	Method SetcFil(cFil)
	Method SetcID(cId)
	Method SetdEmissao(dEmissao)
	Method SetoFornecedor(oFornecedor)
	Method SetoCondPg(oCondPg)
	Method SetcContato(cContato)
	Method SetcFilEntrega(cFilEntrega)
	Method SetnMoeda(nMoeda)
	Method SetnTaxa(nTaxa)
	Method SetcNatureza(cNatureza)
	
EndClass


Class UYPedidoCompraItens From UYObject
	Data oProduto
	Data nQuant
	Data oTabPreco
	Data oCentroCusto
	Data oItemConta
	Data oTes
	
	
	New() Constructor
EndClass

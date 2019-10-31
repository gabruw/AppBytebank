import 'package:flutter/material.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:bytebank/views/transferencia/formulario.dart';
import 'package:bytebank/components/item_listaTranferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Tranferências"),),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index){
          return ItemTransferencia(widget._transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida){
            if(transferenciaRecebida != null){
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}
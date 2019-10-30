import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text("Tranferências"),),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
    body: ListaTransferencias()
  ),
));


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext build){
    return Column(
      children: <Widget>[
        ItemTransferencia("100.00", "10-100-5"),
        ItemTransferencia("200.00", "10-110-7"),
        ItemTransferencia("300.00", "10-120-9"),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext build){
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta),
      ),
    );
  }
}

class Transferencia{
  final double valor;
  final String conta;

  Transferencia(this.valor, this.conta);
}
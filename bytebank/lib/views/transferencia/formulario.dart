import 'package:flutter/material.dart';
import 'package:bytebank/components/input_field.dart';
import 'package:bytebank/views/transferencia/lista.dart';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _ctlInputNumeroConta = TextEditingController();
  final TextEditingController _ctlInputValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Criando Transferência"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputField(controller: widget._ctlInputNumeroConta, labelText: 'Número da Conta', hintText: '0000',),
            InputField(controller: widget._ctlInputValor, labelText: 'Valor', hintText: '0.00', icon: Icons.monetization_on,),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => createTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void createTransferencia(BuildContext context) {
    final String numConta = widget._ctlInputValor.text;
    final double valor = double.tryParse(widget._ctlInputNumeroConta.text);
    
    if(numConta != null && valor != null){
      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Transação efetuada com sucesso!"),
        ),
      );

      Navigator.pop(context, ListaTransferencias);
    }
  }
}
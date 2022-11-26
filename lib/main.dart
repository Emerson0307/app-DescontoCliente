import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}
  class MyApp extends StatefulWidget {
    const MyApp({ Key? key }) : super(key: key);
  
    @override
    _MyAppState createState() => _MyAppState();
  }
  
  class _MyAppState extends State<MyApp> {
    String _info= "Informe o valor da compra e o tipo de cliente sendo: 1 - comum / 2 - funcionario / 3 - vip";

    GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    TextEditingController desccontroller = TextEditingController();
    TextEditingController typecontroller = TextEditingController();

void _resetFields() {
  desccontroller.text = "";
  typecontroller.text = "";
  setState(() {_info="Informe o valor da compra: ";
  _formkey = GlobalKey<FormState>();
    
  });

}

  void _calcular() {
    setState((){
      double valcomp = double.parse(desccontroller.text);
      double type = double.parse(typecontroller.text);
      

     if(type == 2){
         double desconto = valcomp * 0.1;
         double valorcheio = valcomp - desconto;
        _info = "Valor da compra com desconto para funcionarios! (${valorcheio.toStringAsFixed(2)})";
      } else if (type == 3){
        double desconto = valcomp * 0.05;
        double valorcheio = valcomp - desconto;
        _info = "Valor da compra com desconto para vip! (${valorcheio.toStringAsFixed(2)})";
      } else if (type == 1) {
        _info = "Valor da compra: (${valcomp.toStringAsFixed(2)})";
      }
      
    }

    );
  }
    @override
    Widget build(BuildContext context) {
      return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calcula desconto"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget> [
            IconButton(
              onPressed: _resetFields,
             icon: const Icon(Icons.refresh)
             )
          ]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0,10,0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline,
                  size: 120.0, color: Colors.green),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor!",
                labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25.0),
                controller: desccontroller,
                validator: (value) {
                  if (value!.isEmpty){
                    return "Insira o valor da compra: ";
                  }
                  return null;
                },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tipo de desconto",
                labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25.0),
                controller: typecontroller,
                validator: (value) {
                  if (value!.isEmpty){
                    return "Funcionario ou vip ";
                  }
                  return null;
                },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if(_formkey.currentState!.validate()) {
                      _calcular();
                    }
                  },
                  
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ),
            Text(
              _info,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25),
            )
            ],
            ),

          ))));
    }
  }

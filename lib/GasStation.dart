// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GasStation extends StatefulWidget {
  const GasStation({Key? key}) : super(key: key);

  @override
  _GasStationState createState() => _GasStationState();
}

class _GasStationState extends State<GasStation> {
  TextEditingController _controllerPrecoAlcool = TextEditingController();
  TextEditingController _controllerPrecoGasolina = TextEditingController();

  String precoAlcool = '';
  String precoGasolina = '';
  String resultado = '';

  void melhorOpcao(String precoAlcool, String precoGasolina) {
    //replacing , by . on input values
    double precoA = double.parse(precoAlcool.replaceAll(',', '.'));
    double precoG = double.parse(precoGasolina.replaceAll(',', '.'));
    print("Preco do Alcool: ${precoA}");
    print("Preco da Gasolina: ${precoG}");

    if (precoA >= precoG) {
      resultado = "Abasteca com Gasolina!";
    } else {
      resultado = "Abasteca com Alcool!";
    }
    limparCampos();
  }

  void limparCampos() {
    _controllerPrecoAlcool.text = '';
    _controllerPrecoGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ethanol or Gasoline?'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/logo.png'),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço Alcool, ex: 5.45',
                ),
                controller: _controllerPrecoAlcool,
                onChanged: (String s) {
                  precoAlcool = _controllerPrecoAlcool.text;
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço Gasolina, ex: 6.85',
                ),
                controller: _controllerPrecoGasolina,
                onChanged: (String s) {
                  precoGasolina = _controllerPrecoGasolina.text;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                        ),
                        child: Text(
                          'Calcular',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            melhorOpcao(precoAlcool, precoGasolina);
                          });
                        },
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  resultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

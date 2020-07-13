import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases do Dia',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  List<String> _frases = [
    "Aprenda a receber críticas, pois nem todo crítico é um inimigo!",
    "O que vem fácil, vai fácil, acaba rápido e não traz felicidade.",
    "A dor nos ajuda a adquirir maturidade.",
    "Suba o primeiro degrau com fé. Não é necessário que você veja toda a escada, apenas dê o primeiro passo.",
    "Você tem que acordar cada manhã com determinação se você pretende ir para a cama com satisfação.",    
  ];

  String _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    int numeroSorteada = Random().nextInt(5);
    if(_fraseGerada == _frases[numeroSorteada]){
      numeroSorteada = Random().nextInt(5);
     
    }
    setState(() {
      _fraseGerada = _frases[numeroSorteada];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.width * 2/5,
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                  width: size.width * 0.75,
                ),
              ),
              SizedBox(
                height: size.width * 1.5/5,
                child: Text(
                  _fraseGerada,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontFamily: "Courier New",
                  ),
                ),
              ),
              SizedBox(                
                height: size.height * 0.3/5,
                child: Material(
                  color: Colors.green,
                  elevation: 2,
                  child: InkWell(
                    onTap: _gerarFrase,
                    child: Container(
                      width: size.width * 0.5,
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Nova Frase",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

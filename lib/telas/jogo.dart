import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Faça Sua Escolha";
  var _app = 0;

  var _jogador = 0;
  var _escolhaApp = "";
  var escolhajogador = "";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("App" + escolhaApp);
    print("Usuário: " + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("imagens/pedra.png");
          _escolhaApp = "pedra";
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("imagens/papel.png");
          _escolhaApp = "papel";
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("imagens/tesoura.png");
          _escolhaApp = "tesoura";
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra"))
      setState(() {
        this._mensagem = "Parabéns ! Você ganhou :)";
        _jogador++;
      });
    else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra"))
      setState(() {
        this._mensagem = "Deu Ruim! Você perdeu :(";
        _app++;
      });
    else {
      setState(() {
        this._mensagem = "Ficamos no Empate !";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        //  Image.asset( "imagens/colorido.jpg", fit: BoxFit.cover,),
        Padding(
          padding: EdgeInsets.only(top: 35, bottom: 16),
          child: Text(
            "App: $_escolhaApp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Image(image: this._imagemApp),
        Padding(
          padding: EdgeInsets.only(top: 35, bottom: 16),
          child: Text(
            "Jogador: $escolhajogador",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        /*Text("Resultado", textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red)),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _opcaoSelecionada("pedra");
                setState(() {
                  escolhajogador = "pedra";
                });
              },
              child: Image.asset(
                "imagens/pedra.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                _opcaoSelecionada("papel");
                setState(() {
                  escolhajogador = "papel";
                });
              },
              child: Image.asset(
                "imagens/papel.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                _opcaoSelecionada("tesoura");
                setState(() {
                  escolhajogador = "tesoura";
                });
              },
              child: Image.asset(
                "imagens/tesoura.png",
                height: 100,
              ),
            ),
          ],
        ),
        //image
        //text
        Padding(
          padding: EdgeInsets.only(top: 35, bottom: 16),
          child: Text(
            this._mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 70, bottom: 16),
          child: Text(
            "App: $_app         Jogador: $_jogador",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      ]),
    );
  }
}

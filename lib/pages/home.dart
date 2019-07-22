import 'package:flutter/material.dart';
import 'package:pizzaria/models/mpizza.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pizza> listaPizzas = [
    Pizza(
      nome: "Batata Frita",
      ingredientes: "Bata Frita, Massa de tomate, Mussarela, Azeitona",
      imagem: "images/pizzas/pizza_batata_frita.png",
    ),
    Pizza(
      nome: "Calabresa",
      ingredientes: "calabresa, Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_calabresa.png",
    ),Pizza(
      nome: "Camarao",
      ingredientes: "camarão, Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_camarao.png",
    ),Pizza(
      nome: "Frutos do mar",
      ingredientes: "frutos do mar, Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_frutos_mar.png",
    ),Pizza(
      nome: "Manjericao",
      ingredientes: "manjericao, Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_manjericao.png",
    ),Pizza(
      nome: "Mussarela",
      ingredientes: " Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_mussarela.png",
    ),Pizza(
      nome: "Portuguesa",
      ingredientes: " Presunto, mussarela, Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_portuguesa.png",
    ),Pizza(
      nome: "Strogonoff",
      ingredientes: " Presunto, mussarela, Massa de tomate, Mussarela, Azeitona, orégano",
      imagem: "images/pizzas/pizza_strogonoff.png",
    ),
  ];

  ListTile criarListTile(IconData icone, String texto) {

    return ListTile(
      leading: Icon(icone, color: Colors.white),
      title: Text(texto,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.deepOrange,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.local_pizza),
            SizedBox(width: 5.0),
            Text("Ma´que Pizza")
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: ListView.builder(
        itemCount: listaPizzas.length,
        itemBuilder:(BuildContext context, int index){
          print("Qual é o índice da pizza ${listaPizzas[index].nome}? $index");
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(listaPizzas[index].imagem),
                ),
                title: Text(listaPizzas[index].nome),
                subtitle: Text(listaPizzas[index].ingredientes),
              ),
              Divider(color: Colors.blueGrey),
            ],
          );
      },),
      //Widget que serve para construir ou fazer o menu "gaveta"
      //É o menu que aparece quando apertamos nos três pauzinhos(Hamburguer Buttom);
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 30, 45, 62),
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 38, 52, 69),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 140.0,
                      ),
                    ),
                    //é um botão que parece só um texto
                    //ou seja, não tem sombreamento
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //ListTile cria itens de lista
              //pode ter icones no começo e no fim de cada item
              //separamos em um método para ficar mais organizado
              criarListTile(Icons.list, "Cardápio"),
              criarListTile(Icons.local_drink, "Bebidas"),
              criarListTile(Icons.cake, "Sobremesas"),

              Divider(
                color: Colors.white,
              ),
              criarListTile(Icons.star, "Avalie o App"),
              criarListTile(Icons.info, "Sobre"),
              criarListTile(Icons.perm_phone_msg, "Contato"),
              criarListTile(Icons.settings, "Configurações"),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tcc_bianca/pages/teste.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color appBarColor = Colors.blue;

  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _textosCores = [
  {"img": "assets/images/azul.jpg", "color": Colors.blueAccent, "cor": "Azul", "texto": "Utilizado em sua maioria como cor principal dos aplicativos, pode ser usado em botões que remetem ações positivas.", "tags": "contemplação, paz, paciência, emoções mais amenas e leves."},
  {"img": "assets/images/cinza.jpg", "color": Colors.grey, "cor": "branco e cinza", "texto": "Utilizado como cor de fundo ou como cor para dar contraste.", "tags": "luminosidade, limpeza e tranquilidade."},
  {"img": "assets/images/verde.jpg", "color": Colors.green, "cor": "verde", "texto": "Utilizado em botões que remetem ações positivas e elementos do site ou aplicativo, também pode ser usado como cor de fundo.", "tags": "cura, perseverança, natureza."},
  {"img": "assets/images/vermelho.jpg", "color": Colors.red, "cor": "vermelho", "texto": "Utilizado para ações que remetem perigo ou que demandam a atenção do usuário, como por exemplo um botão de excluir.", "tags": "paixão, fúria, violência, fome, todo tipo de sensação intensa."},
  {"img": "assets/images/amarelo.jpg", "color": Colors.yellow, "cor": "Amarelo", "texto": "Utilizado em ícones ou em mensagens de aviso.", "tags": "alegria, relaxamento, felicidade."},
  {"img": "assets/images/laranja.jpg", "color": Colors.orange, "cor": "Laranja", "texto": "Utilizado em ícones diversos, botões, é uma cor de destaque e complementar.", "tags": "bom humor, energia, equilíbrio."},
  {"img": "assets/images/preto.jpg", "color": Colors.black, "cor": "preto", "texto": "Utilizado em escrita ou ícones.", "tags": "elegância, riqueza, mistério, medo e anonimato."},
  {"img": "assets/images/roxo.jpg", "color": Colors.purple, "cor": "Violeta", "texto": "Utilizado como cor principal do aplicativo ou em ícones da tela.", "tags": "sensualidade, nobreza, mistério, transformação, a cor das descobertas."},
  {"img": "assets/images/rosa.jpg", "color": Colors.pink, "cor": "Rosa", "texto": "Utilizado em botões, pode ser usado como cor principal acompanhada de várias variações de degradê.", "tags": "delicadeza, romantismo e inocência."}
  ];

  Widget pages(BuildContext context, int page){
    if(page == 0) {
      return ListView.builder(
        itemCount: _textosCores.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(_textosCores[index]['cor']),
              subtitle: Text(_textosCores[index]['tags']),
              leading: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                width: MediaQuery.of(context).size.width * 0.115,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.black, width: 3),
                    color: _textosCores[index]['color']
                ),
              ),
              onTap: (){

                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text(_textosCores[index]['cor']),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text("Fechar")
                      )
                    ],
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(_textosCores[index]['texto']),
                          const SizedBox(height: 5),
                          const Text("Exemplos:"),
                          const SizedBox(height: 5),
                          Image.asset(_textosCores[index]['img'])
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          );
      });
    }
    if(page == 1) {
      return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Nessa tela você vai poder colorir e inserir imagens de sua preferência, faça combinações de acordo com o que aprendeu sobre as cores, na tela anterior.", style: TextStyle(fontSize: 22, color: Colors.white), textAlign: TextAlign.center),
          const SizedBox(height: 25),
          const Text("Para colorir a tela é necessário clicar no pincel disponível.", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
          const Icon(Icons.brush, color: Colors.white),
          const Text("Para escrever clique na caneta.", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
          const Icon(Icons.edit, color: Colors.white),
          const Text("Para inserir imagens clique nas imagens.", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
          const Icon(Icons.image, color: Colors.white),
          SizedBox(
            width: 135,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teste()));
                },
                child: const Row(
                  children: [
                    Icon(Icons.edit),
                    Text("Montar tela")
                  ],
                )
            ),
          )
        ],
      ),
    );
    }
    if(page == 2) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text("Esse aplicativo foi desenvolvido com o intuito de complementar o trabalho de conclusão do curso de sistemas para internet, cujo tema é Psicologia das cores na produção de interfaces digitais.",
                  style: TextStyle(fontSize: 18)
              ),
              SizedBox(height: 10),
              Image(image: AssetImage("assets/images/divertidamente.jpg")),
              SizedBox(height: 10),
              Text("O trabalho apresentou como referência de cores o filme divertidamente, cada personagem foi usado para explicar sobre sua cor e como a mesma pode refletir nos usuários.",
                  style: TextStyle(fontSize: 18)
              ),
              SizedBox(height: 15),
              Text(" Este trabalho buscou realizar um estudo sobre a psicologia das cores e como ela pode ser usada de maneira eficaz em interfaces digitais, de modo a minimizar desconfortos e dúvidas que possam transmitir informações equivocadas ao usuário.",
                  style: TextStyle(fontSize: 18)
              ),
              SizedBox(height: 15),
              Text("Este estudo é relevante uma vez que compreender os efeitos causados pelo uso de cores, permite identificar possíveis estratégias para tornar mais efetiva a experiência do usuário em interfaces digitais.",
                  style: TextStyle(fontSize: 18)
              ),
              SizedBox(height: 15),
              Text("Para maiores detalhes o trabalho está disponível abaixo.",
                  style: TextStyle(fontSize: 18)
              )
            ],
          ),
        )
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cores"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note, color: Colors.white),
            label: "Teste"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark, color: Colors.white),
            label: "Sobre o app",
          )
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: (selected){
          setState(() {
            _selectedIndex = selected;
          });
        },
      ),
      body: pages(context, _selectedIndex),
    );
  }
}

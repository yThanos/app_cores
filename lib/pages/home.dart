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
  {"color": Colors.blueAccent, "cor": "Azul", "texto": "Utilizado em sua maioria como cor principal dos aplicativos, pode ser usado em botões que remetem ações positivas.", "tags": "contemplação, paz, paciência, emoções mais amenas e leves;"},
  {"color": Colors.grey, "cor": "branco e cinza", "texto": "Utilizado como cor de fundo ou como cor para dar contraste.", "tags": "luminosidade, limpeza e tranquilidade"},
  {"color": Colors.greenAccent, "cor": "verde", "texto": "Utilizado em botões que remetem ações positivas e elementos do site ou aplicativo, também pode ser usado como cor de fundo.", "tags": "cura, perseverança, natureza;"},
  {"color": Colors.red, "cor": "vermelho", "texto": "Utilizado para ações que remetem perigo ou que demandam a atenção do usuário, como por exemplo um botão de excluir.", "tags": "paixão, fúria, violência, fome, todo tipo de sensação intensa"},
  {"color": Colors.yellow, "cor": "Amarelo", "texto": "Utilizado em ícones ou em mensagens de aviso.", "tags": "alegria, relaxamento, felicidade;"},
  {"color": Colors.orange, "cor": "Laranja", "texto": "Utilizado em ícones diversos, botões, é uma cor de destaque e complementar.", "tags": "bom humor, energia, equilíbrio;"},
  {"color": Colors.black, "cor": "preto", "texto": "Utilizado em escrita ou ícones.", "tags": "elegância, riqueza, mistério, medo e anonimato"},
  {"color": Colors.purple, "cor": "Violeta", "texto": "Utilizado como cor principal do aplicativo ou em ícones da tela.", "tags": "sensualidade, nobreza, mistério, transformação, a cor das descobertas."},
  {"color": Colors.pink, "cor": "Rosa", "texto": "Utilizado em botões, pode ser usado como cor principal acompanhada de várias variações de degradê.", "tags": "delicadeza, romantismo e inocência"}
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
                        child: Text("Fechar")
                      )
                    ],
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(_textosCores[index]['texto']),
                          const SizedBox(height: 5),
                          const Text("Exemplos:"),
                          const SizedBox(height: 5),
                          (_textosCores[index]['cor'] == "Azul")
                              ?Image.asset("assets/images/azul1.png")
                              :Container()
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
          const Text("Explicação de como é o teste e taus uma imagem mostrando fecho"),
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
      return Container();
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
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note),
            label: "Teste"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: "Sobre o app"
          )
        ],
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

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

  Widget pages(BuildContext context, int page){
    if(page == 0) {
      return Container();
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

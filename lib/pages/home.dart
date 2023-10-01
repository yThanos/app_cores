import 'package:flutter/material.dart';
import 'package:tcc_bianca/pages/teste.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Color appBarColor = Colors.blue;

  int _selectedIndex = 0;

  Widget pages(BuildContext context, int page){
    if(page == 0)
      return Container();
    if(page == 1)
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Explicação de como é o teste e taus uma imagem mostrando fecho"),
          SizedBox(
            width: 135,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> teste()));
                },
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    Text(" Montar tela")
                  ],
                )
            ),
          )
        ],
      ),
    );
    if(page == 2)
    return Container();
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cores"),
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

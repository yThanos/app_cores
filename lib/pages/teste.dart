import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tcc_bianca/pages/home.dart';

class teste extends StatefulWidget {
  const teste({super.key});

  @override
  State<teste> createState() => _testeState();
}

class _testeState extends State<teste> {

  Color appBarColor = Color(0xff443a49);
  List<Widget> pages = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cores"),
        backgroundColor: appBarColor,
        actions: [
          InkWell(
            onTap: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text("Escolha cor"),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: appBarColor,
                      onColorChanged: (change){
                        setState(() {
                          appBarColor = change;
                        });
                      }
                    ),
                  ),
                );
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              padding: EdgeInsets.all(5),
              child: Icon(Icons.edit),
            ),
          )
        ],
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
              label: "Sobre nós"
          )
        ],
        currentIndex: 1,
        onTap: (selected){

        },
      ),
    );
  }
}

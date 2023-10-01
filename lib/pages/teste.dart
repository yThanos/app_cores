import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tcc_bianca/pages/editable/form.dart';

class teste extends StatefulWidget {
  const teste({super.key});

  @override
  State<teste> createState() => _testeState();
}

class _testeState extends State<teste> {

  Color appBarColor = Color(0xff443a49);
  Color _boxColor = Colors.white;
  Color _backGroundColor = Colors.blueGrey;
  String _campo1 = "campo1";
  String _campo2 = "campo2";
  String _campo3 = "campo3";

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      Container(),
      Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        color: _backGroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: IconButton(
                icon: Icon(Icons.brush),
                onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("Escolha cor"),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                            pickerColor: _backGroundColor,
                            onColorChanged: (change){
                              setState(() {
                                _backGroundColor = change;
                              });
                            }
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: _boxColor,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                      icon: Icon(Icons.brush),
                      onPressed: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Escolha cor"),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                  pickerColor: _boxColor,
                                  onColorChanged: (change){
                                    setState(() {
                                      _boxColor = change;
                                    });
                                  }
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      children: [
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            label: Text(_campo1),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.brush),
                              onPressed: (){
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text("Titulo do campo"),
                                    content: SingleChildScrollView(
                                      child: Container(
                                        child: TextFormField(
                                          onChanged: (change){
                                            setState(() {
                                              _campo1 = change;
                                            });
                                          },
                                        ),
                                      )
                                    ),
                                  );
                                });
                              },
                            )
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text(_campo2),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.brush),
                                onPressed: (){
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text("Titulo do campo"),
                                      content: SingleChildScrollView(
                                          child: Container(
                                            child: TextFormField(
                                              onChanged: (change){
                                                setState(() {
                                                  _campo2 = change;
                                                });
                                              },
                                            ),
                                          )
                                      ),
                                    );
                                  });
                                },
                              )
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text(_campo3),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.brush),
                                onPressed: (){
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text("Titulo do campo"),
                                      content: SingleChildScrollView(
                                          child: Container(
                                            child: TextFormField(
                                              onChanged: (change){
                                                setState(() {
                                                  _campo3 = change;
                                                });
                                              },
                                            ),
                                          )
                                      ),
                                    );
                                  });
                                },
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Container()
    ];

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
              child: Icon(Icons.brush),
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
              label: "Formulario"
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
      body: pages[_selectedIndex],
    );
  }
}

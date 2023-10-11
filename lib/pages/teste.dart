import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:image_picker/image_picker.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  Color _appBarColor = Colors.grey;
  Color _appBarIconColor = Colors.white;
  Color _boxColor = Colors.white;
  Color _boxIconColor = Colors.black;
  Color _backGroundColor = Colors.blueGrey;
  Color _backGroundIconColor = Colors.black;
  IconData _icone1 = Icons.construction;
  Color _icone1Color = Colors.white;
  Color _icone1Fundo = Colors.greenAccent;
  IconData _icone2 = Icons.add_road;
  Color _icone2Color = Colors.white;
  Color _icone2Fundo = Colors.greenAccent;
  IconData _icone3 = Icons.baby_changing_station;
  Color _icone3Color = Colors.white;
  Color _icone3Fundo = Colors.greenAccent;
  IconData _icone4 = Icons.safety_check;
  Color _icone4Color = Colors.white;
  Color _icone4Fundo = Colors.greenAccent;
  bool _corFundo = false;
  bool _corIcon = false;
  File? _userImage;
  File? _card1Image;
  File? _card2Image;
  Color _card1 = Colors.white;
  Color _card2 = Colors.white;
  String _card1Titulo = "Titulo";
  String _card1Subtitulo = "Subtitulo";
  String _card2Titulo = "Titulo";
  String _card2Subtitulo = "Subtitulo";


  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);
      });
    }
  }

  _getCard1() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _card1Image = File(pickedFile.path);
      });
    }
  }

  _getCard2() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _card2Image = File(pickedFile.path);
      });
    }
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      Container(),
      Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        color: _backGroundColor,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text("Ok")
                          )
                        ],
                        title: const Text("Escolha cor do fundo"),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                              pickerColor: _backGroundColor,
                              onColorChanged: (change){
                                var luminosidade = (change.red * 299 + change.green * 587 + change.blue * 114) / 1000;
                                if(luminosidade > 127){
                                  _backGroundIconColor = Colors.black;
                                } else {
                                  _backGroundIconColor = Colors.white;
                                }
                                setState(() {
                                  _backGroundColor = change;
                                });
                              }
                          ),
                        ),
                      );
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.075,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Icon(Icons.brush, color: _backGroundIconColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      color: _boxColor,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: IconButton(
                          icon: Icon(Icons.brush, color: _boxIconColor),
                          onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                actions: [
                                  ElevatedButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Ok")
                                  )
                                ],
                                title: const Text("Escolha cor da borda"),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                      pickerColor: _boxColor,
                                      onColorChanged: (change){
                                        var luminosidade = (change.red * 299 + change.green * 587 + change.blue * 114) / 1000;
                                        if(luminosidade > 127){
                                          _boxIconColor = Colors.black;
                                        } else {
                                          _boxIconColor = Colors.white;
                                        }
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
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width * 0.55,
                        margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                        child: InkWell(
                          onTap: _getFromGallery,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              (_userImage == null)
                                  ?Image.network("https://blog.iprocess.com.br/wp-content/uploads/2021/11/placeholder.png", fit: BoxFit.fitWidth)
                                  :Image.file(_userImage!),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Icon(Icons.image)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _icone1Fundo
                    ),
                    child: IconButton(
                      onPressed: () async{
                        var iconData = await FlutterIconPicker.showIconPicker(
                          context,
                          iconPackModes: [IconPack.material],
                          title: const Text("Escolha um icone"),
                          closeChild: ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
                            ),
                            child: const Text("Fechar"),
                          )
                        );
                        if(iconData != null) {
                          _icone1 = iconData;
                        }

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corIcon,
                                        onChanged: (x){
                                          setState(() {_corIcon = !_corIcon;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor do icone"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone1Color,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone1Color = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corFundo,
                                        onChanged: (x){
                                          setState(() {_corFundo = !_corFundo;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor fundo"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone1Fundo,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone1Fundo = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });
                        if(_corFundo){
                          _icone4Fundo = _icone1Fundo;
                          _icone2Fundo = _icone1Fundo;
                          _icone3Fundo = _icone1Fundo;
                        }
                        if(_corIcon){
                          _icone4Color = _icone1Color;
                          _icone2Color = _icone1Color;
                          _icone3Color = _icone1Color;
                        }
                        _corIcon = false;
                        _corFundo = false;
                        setState((){});
                      },
                      icon: Icon(_icone1, size: 58, color: _icone1Color),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _icone2Fundo
                    ),
                    child: IconButton(
                      onPressed: () async{
                        var iconData = await FlutterIconPicker.showIconPicker(
                            context,
                            iconPackModes: [IconPack.material],
                            title: const Text("Escolha um icone"),
                            closeChild: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
                              ),
                              child: const Text("Fechar"),
                            )
                        );
                        if(iconData != null) {
                          _icone2 = iconData;
                        }

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corIcon,
                                        onChanged: (x){
                                          setState(() {_corIcon = !_corIcon;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor do icone"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone2Color,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone2Color = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corFundo,
                                        onChanged: (x){
                                          setState(() {_corFundo = !_corFundo;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor fundo"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone2Fundo,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone2Fundo = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });
                        if(_corFundo){
                          _icone1Fundo = _icone2Fundo;
                          _icone4Fundo = _icone2Fundo;
                          _icone3Fundo = _icone2Fundo;
                        }
                        if(_corIcon){
                          _icone1Color = _icone2Color;
                          _icone4Color = _icone2Color;
                          _icone3Color = _icone2Color;
                        }
                        _corIcon = false;
                        _corFundo = false;
                        setState((){});
                      },
                      icon: Icon(_icone2, size: 58, color: _icone2Color),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _icone3Fundo
                    ),
                    child: IconButton(
                      onPressed: () async{
                        var iconData = await FlutterIconPicker.showIconPicker(
                            context,
                            iconPackModes: [IconPack.material],
                            title: const Text("Escolha um icone"),
                            closeChild: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
                              ),
                              child: const Text("Fechar"),
                            )
                        );
                        if(iconData != null) {
                          _icone3 = iconData;
                        }

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corIcon,
                                        onChanged: (x){
                                          setState(() {_corIcon = !_corIcon;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor do icone"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone3Color,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone3Color = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corFundo,
                                        onChanged: (x){
                                          setState(() {_corFundo = !_corFundo;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor fundo"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone3Fundo,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone3Fundo = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });
                        if(_corFundo){
                          _icone1Fundo = _icone3Fundo;
                          _icone2Fundo = _icone3Fundo;
                          _icone4Fundo = _icone3Fundo;
                        }
                        if(_corIcon){
                          _icone1Color = _icone3Color;
                          _icone2Color = _icone3Color;
                          _icone4Color = _icone3Color;
                        }
                        _corIcon = false;
                        _corFundo = false;
                        setState((){});
                      },
                      icon: Icon(_icone3, size: 58, color: _icone3Color),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.19,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _icone4Fundo
                    ),
                    child: IconButton(
                      onPressed: () async{
                        var iconData = await FlutterIconPicker.showIconPicker(
                            context,
                            iconPackModes: [IconPack.material],
                            title: const Text("Escolha um icone"),
                            closeChild: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
                              ),
                              child: const Text("Fechar"),
                            )
                        );
                        if(iconData != null) {
                          _icone4 = iconData;
                        }

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corIcon,
                                        onChanged: (x){
                                          setState(() {_corIcon = !_corIcon;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor do icone"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone4Color,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone4Color = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });

                        await showDialog(context: context, builder: (context){
                          return StatefulBuilder(builder: (context, setState){
                            return AlertDialog(
                              actions: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: _corFundo,
                                        onChanged: (x){
                                          setState(() {_corFundo = !_corFundo;});
                                        }
                                    ),
                                    Text("Manter mesma cor em todos")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok")
                                )
                              ],
                              title: const Text("Escolha cor fundo"),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: _icone4Fundo,
                                    onColorChanged: (change){
                                      setState(() {
                                        _icone4Fundo = change;
                                      });
                                    }
                                ),
                              ),
                            );
                          });
                        });
                        if(_corFundo){
                          _icone1Fundo = _icone4Fundo;
                          _icone2Fundo = _icone4Fundo;
                          _icone3Fundo = _icone4Fundo;
                        }
                        if(_corIcon){
                          _icone1Color = _icone4Color;
                          _icone2Color = _icone4Color;
                          _icone3Color = _icone4Color;
                        }
                        _corIcon = false;
                        _corFundo = false;
                        setState((){});
                      },
                      icon: Icon(_icone4, size: 58, color: _icone4Color),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _card1
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.25,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: InkWell(
                        onTap: _getCard1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            (_card1Image == null)
                                ?Image.network("https://blog.iprocess.com.br/wp-content/uploads/2021/11/placeholder.png", fit: BoxFit.fitWidth)
                                :Image.file(_card1Image!),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.image)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(_card1Titulo, style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: (){

                            },
                            child: const Icon(Icons.edit),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(_card1Subtitulo, style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: (){

                            },
                            child: const Icon(Icons.edit),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: (){

                        },
                        icon: const Icon(Icons.edit)
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: _card2
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.25,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: InkWell(
                        onTap: _getCard2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            (_card2Image == null)
                                ?Image.network("https://blog.iprocess.com.br/wp-content/uploads/2021/11/placeholder.png", fit: BoxFit.fitWidth)
                                :Image.file(_card2Image!),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.image)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(_card2Titulo, style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: (){

                            },
                            child: const Icon(Icons.edit),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(_card2Subtitulo, style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: (){

                            },
                            child: const Icon(Icons.edit),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: (){

                        },
                        icon: const Icon(Icons.edit)
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
      Container()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Cores", style: TextStyle(color: _appBarIconColor)),
        backgroundColor: _appBarColor,
        actions: [
          InkWell(
            onTap: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text("Ok")
                    )
                  ],
                  title: const Text("Escolha cor do cabeçalho"),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: _appBarColor,
                      onColorChanged: (change){
                        setState(() {
                          var luminosidade = (change.red * 299 + change.green * 587 + change.blue * 114) / 1000;
                          if(luminosidade > 127){
                            _appBarIconColor = Colors.black;
                          } else {
                            _appBarIconColor = Colors.white;
                          }
                          _appBarColor = change;
                        });
                      }
                    ),
                  ),
                );
              });
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              padding: const EdgeInsets.all(5),
              child: Icon(Icons.brush, color: _appBarIconColor,),
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
      body: SingleChildScrollView(
        child: pages[_selectedIndex],
      ),
    );
  }
}
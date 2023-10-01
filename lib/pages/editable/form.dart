import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class formExample extends StatefulWidget {
  const formExample({super.key});

  @override
  State<formExample> createState() => _formExampleState();
}

class _formExampleState extends State<formExample> {
  Color _boxColor = Colors.white;
  Color _backGroundColor = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    print("tela forms teste");
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      color: _backGroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: IconButton(
              icon: Icon(Icons.edit),
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
                    icon: Icon(Icons.edit),
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
                      TextFormField(),
                      TextFormField(),
                      TextFormField(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

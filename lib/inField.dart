import 'package:flutter/material.dart';
//import 'tunnel.dart';

class TheTextInput extends StatelessWidget {
  // const TheTextInput({Key key}) : super(key: key);
  String toDo;
  final Function welcome;
  TheTextInput(this.welcome);
  final sasi=TextEditingController();

  void thePassGuy() {
    sasi.clear();
    String todox = toDo;
    if (todox.isNotEmpty) welcome(todox);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: new BoxDecoration(
          color: Color(0xFF34495E),
          borderRadius: new BorderRadius.all(Radius.elliptical(12, 12))),
      //color: Colors.yellow,
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: sasi,
        maxLength: 300,
        textInputAction: TextInputAction.done,
        style: TextStyle(color: Color(0xFFECF0F1), fontSize: 20.0),
        decoration: InputDecoration(
            icon: Icon(Icons.table_chart, color: Color(0xFFECF0F1),),
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_forward,color: Color(0xFFECF0F1)),
              onPressed: () => thePassGuy(),
            ),
            labelText: 'Add your plan',
            labelStyle: TextStyle(color: Color(0xFFECF0F1))),
        onChanged: (value) {
          toDo = value;
        },
        onSubmitted: (_) => thePassGuy(),
      ),
    );
  }
}

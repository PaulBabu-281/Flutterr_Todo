import 'inField.dart';
import 'package:flutter/material.dart';
import 'models/theData.dart';

class MainGuy extends StatefulWidget {
  //const MainGuy({Key key}) : super(key: key);
  @override
  _MainGuyState createState() => _MainGuyState();
}
class _MainGuyState extends State<MainGuy> {
  void welcome(String toDoS) {
    setState(() {
      toDo.add(toDoS);
      status.add(false);
      if (animatedKey.currentState != null)
        animatedKey.currentState.insertItem(toDo.length - 1);
    });
  }

  void deleteit(int i) {
    setState(() {
      animatedKey.currentState.removeItem(i, (context, animation) {
        if (i == 0)
          return theGuyWhoHasit(context, 0, animation);
        else
          return theGuyWhoHasit(context, i - 1, animation);
      });
      toDo.removeAt(i);
      status.removeAt(i);
    });
  }

  List<String> toDo = [];
  //= ['Say hi', 'say hello'];
  List<bool> status = [];
  // = [false, false];
  GlobalKey<AnimatedListState> animatedKey = GlobalKey<AnimatedListState>();

  Widget theList(BuildContext context) {
    return theGuy(context);
  }

  Widget theGuyWithEmptyList(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Image(image: AssetImage('lib/assets/download.png')),
        ),
        Text(
          'Easy Day',
          style: TextStyle(
              color: Color(0xFFECF0F1),
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
        )
      ],
    );
  }

  Widget theGuyWhoHasit(BuildContext context, int index, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF1C40F),
            borderRadius: BorderRadius.all(Radius.elliptical(12, 12))),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(bottom: 5, top: 5),
        // color: Colors.red,
        child: ListTile(
          leading: Checkbox(value: status[index], onChanged: null),
          onTap: () {
            changeStatus(index);
          },
          title: Text(toDo[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteit(index);
            },
          ),
        ),
      ),
    );
  }

  Widget theGuyWithList(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: animatedKey,
        initialItemCount: toDo.length,
        itemBuilder: (context, index, animation) {
          return theGuyWhoHasit(context, index, animation);
        },
      ),
    );
  }

  Widget theGuy(BuildContext context) {
    if (toDo.isNotEmpty)
      return theGuyWithList(context);
    else
      return theGuyWithEmptyList(context);
  }

  void changeStatus(int i) {
    setState(() {
      status[i] = !status[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[TheTextInput(welcome), theList(context)],
      ),
    );
  }
}

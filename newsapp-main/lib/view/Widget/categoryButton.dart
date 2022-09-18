import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../constant.dart';
import '../../controller/Api.dart';
class categoryButton extends StatelessWidget {
  String textButton;
  late Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3,vertical: 5),
      child:  RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: colorButton,
        onPressed: () {

          // Navigator.push(context, MaterialPageRoute(builder: (context)
          // {
          //   return categoryScreen(t)
          // },
          //
          //
          //
          // ));
          //


          
        },
        child: Text("$textButton",
        style:TextStyle(
          fontWeight: FontWeight.w800,color: white
        ) ,),
      ),
    );
  }

categoryButton({
    required this.textButton,
    required this.colorButton,
  });
}

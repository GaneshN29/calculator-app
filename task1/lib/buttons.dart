import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {

  final color;
  final textcolor;
  final String buttonText;
  final buttontapped;
  Mybutton({this.color, this.textcolor, required this.buttonText, this.buttontapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(60)),

            child: Container(
              color: color,
              child: Center(child: Text(buttonText, style: TextStyle(color: textcolor, fontSize: 25 ),),),
            )),
      ),
    );
  }
}

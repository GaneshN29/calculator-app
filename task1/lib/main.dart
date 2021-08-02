import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/buttons.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' show pi;
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  class _HomePageState extends State<HomePage>{
  @override
  var userQ ='';
  var userans ='';
 final List buttons =
 [
   'C','DEL','^','/',
   '9','8','7','x',
   '6','5','4','-',
   '3','2','1','+',
   '0','.','π', '=',
 ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',

      home: Scaffold(
      backgroundColor: Colors.white,

      body: Column(
       children: [
         Expanded(
           child:Container(
             color: Colors.white,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 padding: EdgeInsets.all(20),
                   alignment: Alignment.centerRight,
                   child: Text(userQ, style: TextStyle(fontSize:40),),
               ),
               Container(


                 padding: EdgeInsets.all(20),
                   alignment: Alignment.centerRight,
                   child: Text(userans, style: TextStyle(fontSize:40)),
               )
             ],
           ),
           ),),
         Expanded(
           flex:2,
           child:Container(
             child:GridView.builder(
               itemCount: buttons.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                 itemBuilder: (BuildContext context, int index){
                 if (index ==0){
                 return Mybutton(
                   buttontapped: (){
                     setState(() {
                       userQ='';
                       userans='';
                     });
                   },
                     buttonText: buttons[index],
                   color: Colors.deepPurple,
                   textcolor: Colors.white,);
                 }
                 else if (index ==1){
                   return Mybutton(
                       buttontapped:(){
                     setState(() {
                       userQ = userQ.substring(0,userQ.length-1);
                     });
                   },
                     buttonText: buttons[index],
                     color: Colors.deepPurple,
                     textcolor: Colors.white,);
                 }
                 else if (index ==buttons.length-1){
                   return Mybutton(
                     buttontapped:(){
                       setState(() {
                         equalPressed();
                       });
                     },
                     buttonText: buttons[index],
                     color: Colors.deepPurple,
                     textcolor: Colors.white,);
                 }
                 else {
                     return Mybutton(
                     buttontapped: (){
                       setState(() {
                         userQ += buttons[index];
                       });

    },
                       buttonText: buttons[index],
                       color: Colors.deepPurple,
                       textcolor: Colors.white,);
                   }
                 }

             )
           ),),
       ],
      ),
      ),);
  }
void equalPressed() {
    String finalQ = userQ;
    finalQ = finalQ.replaceAll('x', '*');
    finalQ = finalQ.replaceAll('π', '3.14159');
    Parser p = Parser();
    Expression exp = p.parse(finalQ);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL,cm);
    userans = eval.toString();
}
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/Anxiety.dart';
import 'package:rainbow/screens/RainbowTabs/SelfAwareness.dart';
class SelfSS extends StatefulWidget {


  @override
  _SelfSSState createState() => _SelfSSState();
}

class _SelfSSState extends State<SelfSS> {
  @override
  void initState(){
    Timer(
        Duration(
          seconds: 3,
        ),
            () => Navigator.pushReplacement(context, PageTransition(child: SelfAwareness(), type: PageTransitionType.leftToRight))
    );
    super.initState();
  }
  List Images =[
  "assets/animal1.jpg",
  "assets/animal2.jpg",
  "assets/animal3.jpg",];
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45, // Try
        body: Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images[Random().nextInt(Images.length-1)]),fit: BoxFit.cover
              ),
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     stops: [
              //       0.3,0.6,0.9
              //     ],
              //
              //     colors: [
              //       Colors.black, constantColors.blueGreyColor, Colors.pink
              //     ]
              // )
          ),
          child: Center(

              child: Text("KNOWING YOURSELF IS THE BEGINNING OF ALL WISDOM.",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
              ),)
          ),
        ));
  }
}

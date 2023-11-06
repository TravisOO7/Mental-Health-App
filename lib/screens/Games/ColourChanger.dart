import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/Stress.dart';
class ColourChanger extends StatefulWidget {


  @override
  _ColourChangerState createState() => _ColourChangerState();
}

class _ColourChangerState extends State<ColourChanger> {
  List Colour_array = [Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.purpleAccent,Colors.indigoAccent,Colors.blueAccent,Colors.greenAccent,Colors.yellowAccent,Colors.orangeAccent,Colors.redAccent,Colors.pinkAccent,Colors.pink,];

  int Final_colour=0;
  AudioCache audioCache = new AudioCache();

  //MaterialInkControl inkController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Stress()));
          },
        ),
        backgroundColor: Colors.black,
        title: Text("Tap the screen and have fun"),
      ),
      body: Container(


        child: InkWell(

          // child: InkRipple(
          //   controller:
          // ),
          child: Ink(
            color: Colour_array[Final_colour],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

          ),
          onTap: (){
            audioCache.load("tapsound.mp3");
            audioCache.play("tapsound.mp3");
                setState(() {

              Final_colour= Random().nextInt(15);
              Text(Final_colour.toString());

            });
          },
        ),
      ),
    );
  }
}

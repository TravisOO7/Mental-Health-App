import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Activities/Meditation.dart';
import 'package:rainbow/screens/Games/ColourChanger.dart';
import 'package:rainbow/screens/Journals/Journal.dart';

import 'RainbowTabHelper.dart';

class Stress extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        backgroundColor: constantColors.blueGreyColor.withOpacity(0.7),
        title: Text(
          "Counter Your Stress",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Meditation(Stress())));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: constantColors.blueGreyColor,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: constantColors.blueGreyColor,
                      ),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Meditation',
                            style: TextStyle(
                                fontFamily: "Monteserat",
                                fontSize: 21,
                                color: Colors.yellowAccent),
                          ),
                          Divider(
                            color: constantColors.lightBlueColor,
                            thickness: 2,
                          ),
                          Text('Experience healing with this simple practice',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage('assets/meditation3.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Journal("Relieving Stress",Stress())));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.purple),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Write it out',
                            style: TextStyle(
                                fontFamily: "Monteserat",
                                fontSize: 21,
                                color: Colors.orangeAccent),
                          ),
                          Divider(
                            color: constantColors.lightBlueColor,
                            thickness: 2,
                          ),
                          Text('While writing, you will have clarity',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage('assets/Diary2.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(

              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => ColourChanger()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: constantColors.blueGreyColor,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: constantColors.blueGreyColor,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text('Colour Magic', style: TextStyle(
                              fontFamily: "Monteserat",
                              fontSize: 21,
                              color: Colors.yellowAccent),),
                          Divider(
                            color: constantColors.lightBlueColor, thickness: 2,),
                          Text('Keep tapping the screen',
                              style: TextStyle(fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(

                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),


                          image: DecorationImage(
                            image: AssetImage('assets/rainbowImage.jpg'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),

                  ],


                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/FortuneWheel/ActivateWheel.dart';
import 'package:rainbow/screens/Journals/JournalFace.dart';
import 'package:rainbow/screens/StartScreenHelper.dart';
import 'package:rainbow/services/FirebaseWork.dart';

import 'Account.dart';
import 'Activities/StarGazing.dart';
import 'FortuneWheel/SpinWheel.dart';
import 'Home.dart';
import 'RainbowTabs/Communication.dart';
import 'RainbowTabs/Confidence.dart';
import 'RainbowTabs/EmotionManagement.dart';
import 'RainbowTabs/FocusGames.dart';
import 'RainbowTabs/SelfAwareness.dart';
import 'RainbowTabs/Stress.dart';
import 'SplashScreens/AnxietySS.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  ConstantColors constantColors = ConstantColors();
  PageController pgController = PageController();
  List Colour_array = [
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];



  int _currentIndex = 0;
  int pageIndex = 0;

  //Provider.of<StartScreenHelper>(context, listen: false)
  //           .startScreenBody(context, tabName, tabs),


  @override
  void initState(){
    Provider.of<FirebaseWork>(context,listen: false).initialiseData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: PageView(
        controller: pgController,
        children: [
          Home(),
          SpinWheel(),
          JournalFace(),
          StarGazing(),
          Account(),

        ],
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        backgroundColor: constantColors.darkColor,
        unSelectedColor: Colors.white,
        selectedColor: Colour_array[pageIndex],
          onTap: (val){
          setState(() {
            pageIndex = val;
            pgController.jumpToPage(val);
          });



          },
        items: [

          CustomNavigationBarItem(

            icon: Icon(Icons.home),
            selectedTitle: Text('Home',style: TextStyle(color:Colors.purple),),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard_sharp),
            selectedTitle: Text('Fortune Wheel',style: TextStyle(color:Colors.blue),),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            selectedTitle: Text('All Journals',style: TextStyle(color:Colors.green),),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.star_border_rounded),
            selectedTitle: Text('Star Gazing',style: TextStyle(color:Colors.yellow),),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            selectedTitle: Text('Account',style: TextStyle(color:Colors.redAccent),),
          ),

        ],
    currentIndex: pageIndex,

    ),
      );
  }
}

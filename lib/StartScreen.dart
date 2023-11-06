import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';


import 'StartScreenHelper.dart';
class StartScreen extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();

  List tabs = ["Relieving Stress", "Improving Focus", "Quitting Anxiety", "Boost Confidence",
    "Emotion Management","Self Awareness", "Better Communication"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body:  Provider.of<StartScreenHelper>(context,listen: false).startScreenBody(context, tabs),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

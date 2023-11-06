import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rainbow/constants/Constantcolors.dart';


import 'RainbowTabS/RainbowTab.dart';


class StartScreenHelper with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  var colors = [
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red
  ];

  var tabs = [

  ];

  Widget startScreenBody(BuildContext context, List tabs) {
    return  StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: tabs.length,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        itemBuilder: (BuildContext context, int index)
        {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RainbowTab()));

            },
            child: Container(


              child: Card(
                color: colors[index],


                child: Center(
                  child: (
                      Text(tabs[index], style: TextStyle(color: constantColors.darkColor,fontSize: 18,fontFamily: 'Monteserat',),textAlign: TextAlign.center,)
                  ),
                ),
              ),
            ),
          );
        },

        staggeredTileBuilder: (index){
          return StaggeredTile.count(index==3?2:1,(index%5==0)?2: 1);
        }
    );
  }
}

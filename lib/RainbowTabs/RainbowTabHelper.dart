import 'package:flutter/material.dart';

class RainbowTabHelper with ChangeNotifier{
  Widget tabBody(var screens){
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> screens[screens.keys[index]]));
        },
        child: Container(
          child: Card(
            child: Text(screens.keys[index]),
          ),
        ),
      );
    },
      itemCount: screens.length,
      padding: EdgeInsets.all(5),

    );
  }
}
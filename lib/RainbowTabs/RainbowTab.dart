import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/screens/Activities/Meditation.dart';

import 'RainbowTabHelper.dart';
class RainbowTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<RainbowTabHelper>(context, listen: false).tabBody(
          {"Meditation":Meditation()}),
    );
  }
}

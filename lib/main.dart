import 'package:flutter/material.dart';
import 'package:uidesign/screens/landingscreen.dart';
import 'package:uidesign/screens/sachinform.dart';
import 'dart:ui';

import 'package:uidesign/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth=window.physicalSize.width;
    return MaterialApp(
      title: "Episode 1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        accentColor: COLOR_DARK_BLUE,
        textTheme: screenWidth <500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,fontFamily: "Montserrat"),
      home: RegisterOwner(),
    );
  }

}


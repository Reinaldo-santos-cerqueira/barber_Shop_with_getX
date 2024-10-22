import 'package:flutter/material.dart';

class GetSize {
  Size sizeScreen(context) {
    return MediaQuery.of(context).size;
  }

  double getHeightWithoutAppBar(context){
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    return screenHeight - appBarHeight;
  }
}
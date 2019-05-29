import 'package:flutter/material.dart';
import 'package:plantes/ui/home/GradienAppBar.dart';
import 'HomePageBody.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradienAppBar("treva"),
          new HomePageBody()
        ],
      ),
    );
  }
}
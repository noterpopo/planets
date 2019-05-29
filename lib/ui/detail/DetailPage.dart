import 'package:flutter/material.dart';
import 'package:plantes/model/Planet.dart';
import 'package:plantes/ui/commom/Style.dart';

import 'PlanetSummary.dart';
import 'Separator.dart';

class DetailPage extends StatelessWidget{
  final Planet planet;

  Container _getBackground(){
    return new Container(
      child: new Image.network(planet.picture,fit: BoxFit.cover,height: 300.0),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }
  Container _getGradient(){
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new  Color(0xFF736AB7)
          ],
          stops: [0.0,0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0)
        )
      ),
    );
  }

  Widget _getContent(){
    final _overviewTitle="Overview".toUpperCase();
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(planet,horizontal: false,),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_overviewTitle,style: Style.headerTextStyle,),
              new Separator(),
              new Text(planet.description,style: Style.baseTextStyle,)
            ],
          ),
        )
      ],
    );
  }

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight=MediaQuery.of(context).padding.top;
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        color: const Color(0xFF736AB7),
        constraints: new BoxConstraints.expand(),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
          ],
        ),
      ),
    );
  }
}
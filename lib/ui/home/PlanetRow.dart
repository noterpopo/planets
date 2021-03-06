import 'package:flutter/material.dart';
import 'package:plantes/model/Planet.dart';
import 'package:plantes/ui/commom/Style.dart';
import 'package:plantes/ui/detail/DetailPage.dart';

class PlanetRow extends StatelessWidget{
  final Planet planet;


  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail=new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      )
    );
    Widget _planetValue({String value, String image}) {
      return new Row(
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(value, style:Style.regularTextStyle),
          ]
      );
    }
    final planetCardContent=new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name,style: Style.headerTextStyle),
          new Container(height: 10.0),
          new Text(planet.location,style: Style.subHeaderTextStyle),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 10.0,
            color: const Color(0xff00c6ff),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(child: _planetValue(value: planet.distance,image: 'assets/img/ic_distance.png')),
              new Expanded(child: _planetValue(value: planet.gravity,image: 'assets/img/ic_gravity.png'))
            ],
          )
        ],
      ),
    );
    final planetCard=new Container(
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
          color: const Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0)
            )
          ]
      ),
      child: planetCardContent,
    );
    return new GestureDetector(
      onTap: ()=>Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (_,__,___)=>new DetailPage(planet)
      )),
      child: new Container(
          margin: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail
            ],
          ),
      )
    );
  }
}
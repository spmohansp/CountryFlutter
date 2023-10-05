import "package:flutter/material.dart";
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  	final Map country;
  	Country(this.country);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.green,
				title: Text(country['name']),
			),
			body: Container(
				padding: EdgeInsets.all(15.0),
				child: GridView(
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
					children: <Widget>[
						FlipCard(
							direction: FlipDirection.VERTICAL, // default
							front: CountryCard(title:'Capital'),
							back: CountryDetailCard(title:country['capital'],color:Colors.lightBlue),
						),
						FlipCard(
							direction: FlipDirection.HORIZONTAL, // default
							front: CountryCard(title:'Population'),
							back: CountryDetailCard(title:country['population'].toString(),color:Colors.yellow),
						),
						FlipCard(
							direction: FlipDirection.HORIZONTAL, // default
							front: CountryCard(title:'Currency'),
							back: CountryDetailCard(title:country['currencies'][0]['name'] +' ( ' +country['currencies'][0]['symbol']+' )',color:Colors.blue),
						),
						FlipCard(
							direction: FlipDirection.VERTICAL, // default
							front: CountryCard(title:'Time Zone'),
							back: CountryDetailCard(title:country['timezones'][0],color:Colors.lime),
						),
						FlipCard(
							direction: FlipDirection.HORIZONTAL, // default
							front: CountryCard(title:'Region'),
							back: CountryDetailCard(title:country['region'],color:Colors.purple),
						),
						FlipCard(
							direction: FlipDirection.HORIZONTAL, // default
							front: CountryCard(title:'Sub Region'),
							back: CountryDetailCard(title:country['subregion'],color:Colors.lightGreen),
						),
						FlipCard(
							direction: FlipDirection.HORIZONTAL, // default
							front: CountryCard(title:'Calling Code'),
							back: CountryDetailCard(title:'+ '+country['callingCodes'][0],color:Colors.lime),
						),
						FlipCard(
							direction: FlipDirection.VERTICAL, // default
							front: CountryCard(title:'Native Name'),
							back: CountryDetailCard(title:country['nativeName'],color:Colors.red),
						),
						FlipCard(
							direction: FlipDirection.VERTICAL, // default
							front: CountryCard(title:'Flag'),
							back: Container(
								child:Card(
									elevation: 10.0,
									child:Center(
										child: SvgPicture.network(country['flag'],width: 150,),
									)
								),
							),
						),
					],
				),
			),
		);
	}
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
              child:Card(
              elevation: 10.0,
              child:Center(
                child: Text(title,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              )
            ),
        );
  }
}


class CountryDetailCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  const CountryDetailCard({Key key,this.title,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
            child:Card(
              	color: color,
              	elevation: 10.0,
              	child: Center(
            	    child: Text(title,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        	    ),
            ),
    	);
  	}
}


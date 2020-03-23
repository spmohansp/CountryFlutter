import "package:flutter/material.dart";
import './Country.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  bool isSearching = false;
	List countries = [];
  List filterCountries = [];
	getCountries() async{
		var response = await Dio().get('http://restcountries.eu/rest/v2/all');
		return response.data;
	}
	@override
	void initState() { 
	  	super.initState();
		getCountries().then((data){
       		setState(() {
        		countries = filterCountries = data;  
       		});
     	});
	}

  	void _filterCountries(value){
      setState(() {
        filterCountries = countries.where((country)=> country['name'].toLowerCase().contains(value.toLowerCase())).toList();  
      });
  	}
@override
Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.green,
				title: 
		!isSearching ?Text('All Countries List')
		:TextField(
			onChanged: (value){
				_filterCountries(value);
			},
			decoration: InputDecoration(
			icon: Icon(Icons.search,color: Colors.white,),
			hintText: 'Search Country',
			hintStyle: TextStyle(color: Colors.white),
			),
		),
		actions: <Widget>[
			isSearching?
				IconButton(
					icon: Icon(Icons.cancel),
					onPressed: (){
						setState(() {
							this.isSearching=false;
							filterCountries = countries; 
						});
					},
				):IconButton(
					icon: Icon(Icons.search),
					onPressed: (){
						setState(() {
							this.isSearching=true;
						});
					},
				)
		],
			),
			body: Container(
				padding: EdgeInsets.all(10.0),
				child: filterCountries.length>0? ListView.builder(
				itemCount: filterCountries.length,
				itemBuilder: (BuildContext context,int index){
					return GestureDetector(
							onTap: (){
								Navigator.of(context).push(MaterialPageRoute(
									builder:(context)=> Country(filterCountries[index]),
									),
								);
							},
						child: Card(
							elevation: 10.0,
							shape: RoundedRectangleBorder(
								borderRadius: BorderRadius.circular(15.0),
							),
							color: Colors.lightGreen,
							child:Padding(
								padding: EdgeInsets.all(15.0),
									child: Text(filterCountries[index]['name'],style: TextStyle(fontSize: 20.0),textScaleFactor: 1.2,),
								)
							),
						);
				})
				: Center(
					child: CircularProgressIndicator(),
				) 
			),
		);
	}
}
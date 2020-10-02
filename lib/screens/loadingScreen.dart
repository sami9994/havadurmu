import 'package:flutter/material.dart';
import 'package:havadurmu/callapi.dart';
import 'package:havadurmu/screens/Mainscreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  String city;
   void _getData(String str)async{
     callapi _callApi =callapi();
   var getweather = await _callApi.calldata(str);
     List list= getweather['result'];
   if (list.length != 0){
    Navigator.push ( context , PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Mainscreen(getweather,str),
          transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return ScaleTransition(
      alignment: Alignment.centerRight,
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInExpo
      ),
      child: child,
    );
    },

    ), );}


  }
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        appBar: AppBar(
          shadowColor: Colors.grey,
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: Text('Hava Durumu',style: TextStyle(color: Colors.black),),
        ),

        body:  Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container (
                  width: 300 ,
                  child: TextField (
                    style: TextStyle ( color: Colors.amberAccent,
                    ) ,
                    decoration: InputDecoration (
                      hintText: 'Add City'.toUpperCase() ,
                      hintStyle: TextStyle (
                          color: Colors.black , fontSize: 20.0
                      ) ,
                      prefixIcon: Icon (
                        Icons.location_city, color: Colors.amberAccent ,
                        size: 25, ) ,
                    ) ,
                    onChanged: (value) {
                      city = value.trim();
                    } ,
                  ) ,
                ),
                Container(
                  width: 300,
                  child: FlatButton(onPressed:  () {
                     setState(() {
                       if(city != null ){
                         _getData (city);
                       }
                     });
                     },
                    child: Text ( 'search'.toUpperCase() ),textColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30.0)),
                    color: Colors.amberAccent,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

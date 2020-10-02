import 'package:flutter/material.dart';
import 'package:havadurmu/conditions.dart';

class Mainscreen extends StatefulWidget {
  Mainscreen(this.weatherdetails,this.City);
   dynamic weatherdetails ;
   String City;
  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<String> date=[] ;
  List<String> day=[];
  List<String> icons=[];
  List<String> description=[];
  List<String> status=[];
  List<String> temp=[];
  List<String> min=[];
  List<String> night=[];
  weatherConditions weather = weatherConditions();
  @override
  void initState() {
    super.initState ( );
    updateweather(widget.weatherdetails);}
  void updateweather(dynamic data) {
    for(int i=0; i<6;i++) {

      setState((){
        day.add(data['result'][i]['day']);
        date.add(data['result'][i]['date']);
        icons.add(data['result'][i]['icon']);
        temp.add(data['result'][i]['degree']);
        description.add(data['result'][i]['description']);
        min.add(data['result'][i]['min']);
        night.add(data['result'][i]['night']);
      });
    }
  }
  Text text(String string ,double size) {
    return Text(string,style: TextStyle(
      fontSize: size,
      color: Colors.white,

        ));
  }
  Padding buildPadding(int i) {
     return Padding (
       padding: const EdgeInsets.only(left:16.0,right: 16 ,bottom: 16),
        child: Container(
          height:200 ,
          width: 180,
         decoration:BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('${weather.setimage(description[i])}'),
                  fit: BoxFit.cover
              ),
           borderRadius: BorderRadius.all(Radius.circular(10)),

            shape: BoxShape.rectangle,
            border:Border.all(style:BorderStyle.solid ,color: Colors.black54)
            ,boxShadow:  [
            BoxShadow(
              color: Colors.blueGrey,

              offset: Offset(0, 4), // changes position of shadow
            ),
          ],) ,
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              text(day[i] ,15 ),
              text('${date[i]}',10,),
              RotationTransition( turns: AlwaysStoppedAnimation(15 / 360),
                  child: text('${weather.status(description[i])}',40)),
              text('🌞\t${temp[i].substring(0,2)}°C',20),
              text('🌞\t${min[i].substring(0,2)}°C',20,),
              text('🌚\t${night[i].substring(0,2)}°C',20,),
              text('${description[i]}',15),
            ],
          ),
        ),
      );
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.grey,
            centerTitle: true,
            backgroundColor: Colors.amberAccent,
            title: Text('Hava Durumu',style: TextStyle(color: Colors.black),),
          ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey,
          body: Container(
           decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('${weather.setimage(description[0])}'),
                  fit: BoxFit.cover
              )
          ),
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height:300 ,
                    width: 180,
                      decoration:BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('${weather.setimage(description[0])}'),
                              fit: BoxFit.cover
                          ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        color:Colors.amberAccent,
                        shape: BoxShape.rectangle,
                        border:Border.all(style:BorderStyle.solid ,color: Colors.black54)
                        ,boxShadow:  [
                        BoxShadow(
                          color: Colors.blueGrey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],),
                      child: Column(
                      children: <Widget>[
                        text(widget.City ,30),
                        text(day[0] ,20,),
                        text('${date[0]}',15,),
                        RotationTransition(
                            turns: AlwaysStoppedAnimation(15 / 360),
                            child: text('${weather.status(description[0])}',40)),
                        text('🌞 ${temp[0].substring(0,2)}°C',20,),
                        text('🌞${min[0].substring(0,2)}°C',20,),
                        text('🌚\t${night[0].substring(0,2)}°C',20,),
                        text('${description[0]}',20,),
                      ],
                    ),
                  ),
                ),
               Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                   child: Row(
                      children:<Widget>[
                        buildPadding(1),
                        buildPadding(2),
                        buildPadding(3),
                        buildPadding(4),
                        buildPadding(5)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}


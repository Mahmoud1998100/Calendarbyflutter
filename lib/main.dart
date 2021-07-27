
import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'function.dart';

void main() {
  runApp(Map());
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:Colors.deepOrange,
        accentColor: Colors.orangeAccent,
      ),
      debugShowCheckedModeBanner: false,
      title: "Mapfunction",
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final List<Info> li = [
    Info(name: "Mahmoud", hieght: 170, date: DateTime.now()),
    Info(name: "Ahmed", hieght: 175, date: DateTime.now()),
    Info(name: "Amir", hieght: 180, date: DateTime.now()),
    Info(name: "Mahmoud", hieght: 170, date: DateTime.now()),
    Info(name: "Ahmed", hieght: 175, date: DateTime.now()),
    Info(name: "Amir", hieght: 180, date: DateTime.now()),
    Info(name: "Mahmoud", hieght: 170, date: DateTime.now()),
    Info(name: "Ahmed", hieght: 175, date: DateTime.now()),
    Info(name: "Amir", hieght: 180, date: DateTime.now()),
  ];
  DateTime _selectDate;

  void x(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return  ListView.builder(
        itemCount: li.length,
        itemBuilder: (ctx,index){
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Card(
              color: Theme.of(ctx).primaryColor,
              shadowColor: Colors.red,
              margin: EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(li[index].name,style: TextStyle(fontSize: 30,color: Colors.white),),
                        Text("${li[index].hieght}",style: TextStyle(fontSize: 30,color: Colors.white),),
                      ],
                    ),

                    Text("${DateFormat().format(_selectDate)}",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map", style: TextStyle(fontSize: 30, color: Colors.black),),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children :[
            Image.asset('assets/imags/ma.jpg',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
              Positioned(
                bottom: 50.0,
                child: RaisedButton(
                  color: Colors.orangeAccent,

                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                  child: Text(
                    "Datepicker",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                  onPressed: (){
                    showDatePicker(context: context,
                        initialDate: DateTime.utc(2000),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now()).then((value) {
                          if(value==null){return;}
                          setState(() {
                            _selectDate =value;
                          });
                    });
                  },
                ),
              )

            ],

             ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,
          size: 50.0,
        ),
        onPressed: ()=> x(context),
      ),
    );
  }
}

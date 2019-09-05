import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_food/breakfast/breakfast_view.dart';
import 'package:flutter_food/dessert/dessert_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget>_children = [
    BreakFastPage(),
    DessertPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("breakfast"),
            icon: Icon(Icons.folder_open)
          ),
          BottomNavigationBarItem(
              title: Text("Dessertt"),
              icon: Icon(Icons.fastfood)
          )
        ],
      ),
    );
  }
  void onTapTapped(int index){
    setState(() {
    _currentIndex = index;
    });
  }
}


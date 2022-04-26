import 'package:flutter/material.dart';
import 'package:list_filtring/for_each.dart';
import 'package:list_filtring/map.dart';
import 'package:list_filtring/where_function.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapFunction(),
    );
  }
}





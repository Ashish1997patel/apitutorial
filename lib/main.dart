
import 'package:apitutorial/example_five.dart';
import 'package:apitutorial/example_four.dart';
import 'package:apitutorial/example_three.dart';
import 'package:apitutorial/example_tow.dart';
import 'package:apitutorial/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: HomeScreem()
      //home: ExampleTow()
      //home: Examplethree()
      //home: ExmapleFour()
      home:ExampleFive()
     // home:DashBord()


    );
  }
}



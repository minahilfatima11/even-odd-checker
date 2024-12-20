import 'package:flutter/material.dart';
import 'package:is_even_odd/check-number-screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NumberCheckScreen()

    );
  }


}



import 'package:flutter/material.dart';
import 'package:newapp/screens/gallery.dart';

void main(List<String> args) async {
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 24, 44),      ),
      debugShowCheckedModeBanner: false,
      home: GalleryScreen(), 
    );
  }
}

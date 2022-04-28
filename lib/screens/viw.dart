import 'dart:io';


import 'package:flutter/material.dart';

class viewImage extends StatelessWidget {
  final index;
  final String? imagepath;
  const viewImage({Key? key, required this.index, required this.imagepath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(
                        File(imagepath!),
                      ),
                      fit: BoxFit.cover)),
            ),
            Center(
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // deletTile(index, context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

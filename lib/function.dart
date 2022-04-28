import 'dart:io';

import 'package:flutter/material.dart';

final Directory _photoDir =
    Directory('/storage/emulated/0/Pictures/');

class Photos extends StatefulWidget {
  @override
  PhotosState createState() {
    return new PhotosState();
  }
}

class PhotosState extends State {
  @override
  Widget build(BuildContext context) {
    var imageList = _photoDir
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".jpg"))
        .toList(growable: false);

    if (imageList.length > 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Images"),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                childAspectRatio: 4 / 4),
            itemBuilder: (context, index) {
              String imgPath = imageList[index];
              return Material(
                elevation: 8.0,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: InkWell(
                  onTap: () {},
                  child: Hero(
                    tag: imgPath,
                    child: Image.file(
                      File(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Xender images"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text(
              "Sorry, No Images Where Found.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     takepicc();
        //   },
        //   child: Icon(Icons.camera),
        // ),
      );
    }
  }
}
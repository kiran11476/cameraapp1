import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/function.dart';
import 'package:newapp/screens/viw.dart';

import '../functions.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

var currentImage;

var key = 0;

class _GalleryScreenState extends State<GalleryScreen> {
  // var pictureFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
            onPressed: () async {
              pickImage();
            },
            child: const Icon(Icons.camera_alt),
          ),
        ),
        body: GalleryView(),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Gallery"),
          actions: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Photos()));}, icon: Icon(Icons.image))],
        ),
      ),
    );
  }

  pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (_image?.path == null) return;

    setState(() {
      currentImage = _image?.path;
    });
  }
}

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageFiles = initLibrary();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: ValueListenableBuilder(
            valueListenable: imageFiles,
            builder: (
              BuildContext ctx,
              List<FileSystemEntity> imageFiles,
              Widget? child,
            ) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 100 / 120,
                  ),
                  itemBuilder: (ctx, index) {
                    final data = initLibrary().value[index];

                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx1) {
                            return viewImage(
                              imagepath: data.path,
                              index: index,
                            );
                          }));
                        },
                        child: Container(
                          // width: 150,
                          // height: 150,
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: data.path != null
                              ? Image.file(
                                  File(data.path),
                                )
                              : Container(
                                  color: Colors.white,
                                ),
                        ));
                  },
                  itemCount: imageFiles.length,
                ),
              );
            }),
      ),
    );
  }
}

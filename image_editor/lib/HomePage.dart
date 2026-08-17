import 'package:flutter/material.dart';
import 'package:image_editor/ApplyFilters.dart';
import 'package:image_editor/EditImg.dart';
import 'package:image_editor/GetImg.dart';
import 'package:image_editor/SaveInGallery.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _selected = false; //to check if a image is selected or not
  late File
      _image; //here we will store the selected image and apply modifications
  final double _ImageContainerHeight = 450;
  final double _ImageContainerWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text('Flutter Image Editor'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(
              height: _ImageContainerHeight,
              width: _ImageContainerWidth,
              child: _selected // checks if a image is selected or not
                  ? Image.file(_image)
                  : Image.asset('images/cam.png')),
          Row(
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400]),
                  child: Text(
                    'Get_Image', // to select a image from gallery
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var Ifile = await GetiImg(
                        _image); // function called from GetImg.dart
                    if (Ifile != null) {
                      setState(() {
                        _image = Ifile;
                        _selected = true;
                      });
                    }
                  }),
              Spacer(
                flex: 1,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400]),
                  child: Text(
                    'Edit Image', //to start editing the shape, size, etc of the selected image
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var Ifile0 = await EditImg(
                        _image); // function called from EditImg.dart
                    if (Ifile0 != null) {
                      setState(() {
                        _image = Ifile0;
                      });
                    }
                  }),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400]),
                  child: Text(
                    'Apply Filters', //to start apply various photo filters to the selected image
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var Ifile0 = await ApplyFilters(context,
                        _image); // function called from ApplyFilters.dart
                    if (Ifile0 != null) {
                      setState(() {
                        _image = Ifile0;
                      });
                    }
                  }),
              Spacer(
                flex: 1,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400]),
                  child: Text(
                    'Download Editted image', //to save the edited  image to gallery
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await SaveImg(
                        _image); // function called from SaveInGallery.dart
                  }),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      )),
    );
  }
}

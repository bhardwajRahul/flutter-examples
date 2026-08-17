import 'package:photofilters/photofilters.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as image_lib;

Future<dynamic> ApplyFilters(context, image) async {
  var decoded = image_lib.decodeImage(image.readAsBytesSync())!;
  decoded = image_lib.copyResize(decoded, width: 600);
  String fileName = basename(image.path);
  Map imagefile = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PhotoFilterSelector(
        title: Text("Photo Filter Example"),
        image: decoded,
        appBarColor: Colors.greenAccent[400]!,
        filters: presetFiltersList,
        filename: fileName,
        loader: Center(child: CircularProgressIndicator()),
        fit: BoxFit.contain,
      ),
    ),
  );
  if (imagefile.containsKey('image_filtered')) {
    return imagefile['image_filtered'];
  } else {
    return null;
  }
}

// Example: View PDF file
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:view_pdf_file/constants.dart';
import 'package:view_pdf_file/viewPDF.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  ExampleState createState() => ExampleState();
}

class ExampleState extends State<Example> {
  bool isLoading = false;
  late Widget pdfViewer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View PDF File"),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        loadFromAsset();
                      },
                      child: Text("Load local PDF"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        loadFromURL();
                      },
                      child: Text("Load PDF via URL"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> loadFromAsset() async {
    setState(() {
      isLoading = true;
    });
    pdfViewer = SfPdfViewer.asset('assets/Hello.pdf');
    setState(() {
      isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewPDF(viewer: pdfViewer),
      ),
    );
  }

  Future<void> loadFromURL() async {
    setState(() {
      isLoading = true;
    });

    pdfViewer = SfPdfViewer.network(Constants.pdfURL);
    setState(() {
      isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewPDF(viewer: pdfViewer),
      ),
    );
  }
}

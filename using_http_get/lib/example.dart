import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Example: fetch JSON data over HTTP GET and display the results in a list.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final String url = "https://swapi.dev/api/people";
  List? data;

  // Function to get the JSON data
  Future<String> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.parse(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      try {
        if (dataConvertedToJSON.statusCode == 200) {
          // Extract the required part and assign it to the global variable named data
          data = dataConvertedToJSON['results'];
        }
      } catch (e) {
        print(dataConvertedToJSON.statusCode);
      }
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retrieve JSON Data via HTTP GET"),
      ),
      // Create a Listview and load the data when available
      body: ListView.builder(
          itemCount: data == null ? 0 : data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                // Stretch the cards in horizontal axis
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        // Read the name field value and set it in the Text widget
                        data![index]['name'],
                        // set some style to text
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.lightBlueAccent),
                      ),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    getJSONData();
  }
}

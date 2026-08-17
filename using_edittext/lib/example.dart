import 'package:flutter/material.dart';

// Example: a TextField that appends submitted lines to a result view.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String results = "";

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using EditText"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration:
                    const InputDecoration(hintText: "Enter text here..."),
                onSubmitted: (String str) {
                  setState(() {
                    results = "$results\n$str";
                    controller.text = "";
                  });
                },
                controller: controller,
              ),
              Text(results)
            ],
          ),
        ),
      ),
    );
  }
}

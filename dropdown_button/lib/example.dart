import 'package:flutter/material.dart';

// Example: the focused code for this app.
// A DropdownButton that lets the user pick a fruit from a list.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final List<String> _fruits = [
    "Apple",
    "Banana",
    "Pineapple",
    "Mango",
    "Grapes"
  ];

  late List<DropdownMenuItem<String>> _dropDownMenuItems;
  late String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(
      List<String> fruits) {
    List<DropdownMenuItem<String>> items = [];
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String? selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown Button Example"),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please choose a fruit: "),
              DropdownButton<String>(
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          ),
        ),
      ),
    );
  }
}

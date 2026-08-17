import 'package:flutter/material.dart';

// Example: calculate the tip and total from a bill amount and tip percent.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double billAmount = 0.0;
  double tipPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    // Create first input field
    TextField billAmountField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: const InputDecoration(labelText: "Bill amount(\$)"),
    );

    // Create another input field
    TextField tipPercentageField = TextField(
        decoration: const InputDecoration(labelText: "Tip %", hintText: "15"),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          try {
            tipPercentage = double.parse(value);
          } catch (exception) {
            tipPercentage = 0.0;
          }
        });

    // Create button
    ElevatedButton calculateButton = ElevatedButton(
        child: const Text("Calculate"),
        onPressed: () {
          // Calculate tip and total
          double calculatedTip = billAmount * tipPercentage / 100.0;
          double total = billAmount + calculatedTip;

          // Generate dialog
          AlertDialog dialog = AlertDialog(
              content: Text("Tip: \$$calculatedTip \n"
                  "Total: \$$total"));

          // Show dialog
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        });

    Container container = Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [billAmountField, tipPercentageField, calculateButton]));

    AppBar appBar = AppBar(title: const Text("Tip Calculator"));

    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}

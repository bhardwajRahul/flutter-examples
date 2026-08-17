// Example: Todo list using provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers/todo_list.dart';
import 'views/home.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoList>(
      create: (context) => TodoList(),
      child: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

import 'package:flutter/material.dart';

// Example: a collapsing SliverAppBar over a scrolling list of items.
class Example extends StatelessWidget {
  const Example({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar Demo'),
              background: Image(
                image: AssetImage('assets/sample.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            floating: true,
          ),
        ],
        body: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FeedMe',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Feed Me"),
        ),
        body: const Center(
          child: Text("hi feeme?"),
        ),
      ),
    );
  }

}
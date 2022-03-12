import 'package:feed_me/provider/FeedProvider.dart';
import 'package:flutter/material.dart';

import 'pages/main_page.dart';

class FeedMeApp extends StatelessWidget {
  const FeedMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedProvider(
        child: const MaterialApp(
      title: 'FeedMe',
      home: MainPage(),
    ));
  }
}

void main() => runApp(const FeedMeApp());

import 'package:feed_me/provider/feed_provider.dart';
import 'package:feed_me/widgets/feed/feed_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: FeedProvider.followFeedList(context).length,
          itemBuilder: (context, index) {
            return PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: FeedProvider.followFeedList(context)
                  .elementAt(index)
                  .feedItems
                  ?.length,
              itemBuilder: (context, itemIndex) {
                return FeedList(
                  followFeedIndex: index,
                );
              },
            );
          }),
    );
  }
}

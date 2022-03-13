import 'package:feed_me/provider/FeedProvider.dart';
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
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                      child: Text(FeedProvider.followFeedList(context)
                          .elementAt(index)
                          .feedItems!
                          .elementAt(itemIndex)
                          .title
                          .toString())),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          opacity: 1,
                          fit: BoxFit.cover,
                          image:
                              NetworkImage("https://picsum.photos/800/1600"))),
                );
              },
            );
          }),
    );
  }
}

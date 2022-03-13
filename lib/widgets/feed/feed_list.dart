import 'package:feed_me/provider/feed_provider.dart';
import 'package:flutter/material.dart';

import 'feed_list_header.dart';

class FeedList extends StatefulWidget {
  final int followFeedIndex;

  const FeedList({Key? key, required this.followFeedIndex}) : super(key: key);

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    var currentIndex =
        FeedIndexHelper.positions.elementAt(widget.followFeedIndex).current;
    controller = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var indexes = FeedIndexHelper.positions.elementAt(widget.followFeedIndex);
    return PageView.builder(
        itemCount: indexes.total,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (changeIndex) {
          FeedIndexHelper.changeFeedPosition(
              widget.followFeedIndex, changeIndex);
        },
        itemBuilder: (context, index) {
          var feedItem = FeedProvider.getFeedByIndex(
              context, widget.followFeedIndex, index);
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: FeedListHeader(
              title: feedItem.title ?? "",
              description: feedItem.description ?? "",
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 1,
                    fit: BoxFit.cover,
                    image: NetworkImage("https://picsum.photos/800/1600"))),
          );
        });
  }
}

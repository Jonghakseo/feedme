import 'package:feed_me/repo/remote/feed_from_network.dart';
import 'package:flutter/cupertino.dart';

class FeedProvider extends InheritedWidget {
  FeedProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child) {
    //TODO
    // DBManager.instance.database.then((db) => debugPrint(db.isOpen.toString()));
    FeedFromNetwork.fetchRssXml().then(
        (xml) => debugPrint(FeedFromNetwork.xmlToFollowFeed(xml).toString()));

    debugPrint("ㅇㅁㄴㅇㅁㄴㅁㄴㅇㅁㄴ");
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

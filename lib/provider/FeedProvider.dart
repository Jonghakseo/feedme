import 'package:flutter/cupertino.dart';

class FeedProvider extends InheritedWidget {
  FeedProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child) {
    //TODO
    // DBManager.instance.database.then((db) => debugPrint(db.isOpen.toString()));
    // RemoteFeedService.fetchRssXml().then(
    //     (xml) => debugPrint(RemoteFeedService.xmlToFollowFeed(xml).toString()));
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

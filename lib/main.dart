import 'package:feed_me/domain/models/feed_item.dart';
import 'package:feed_me/domain/models/follow_feed.dart';
import 'package:feed_me/domain/services/feed_Items_service.dart';
import 'package:feed_me/provider/FeedProvider.dart';
import 'package:feed_me/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/services/follow_feed_service.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FeedItemAdapter());
  Hive.registerAdapter(FollowFeedAdapter());
  await Hive.openBox<FeedItem>(FeedItem.hiveKey);
  await Hive.openBox<FollowFeed>(FollowFeed.hiveKey);

  FollowFeedService followFeedService = FollowFeedService();
  FeedItemsService feedItemsService = FeedItemsService();

  // String url1 = "https://d2.naver.com/d2.atom";
  // String url2 = "https://nookpi.tistory.com/rss";

  // await followFeedService.addFollowFeedFromRemote(url1);
  // await followFeedService.addFollowFeedFromRemote(url2);
  List<FollowFeed> followFeedList = followFeedService.getFollowFeedList();

  Future.wait(followFeedList.map(
      (feed) async => await feedItemsService.updateFeedItemsFromRemote(feed)));

  debugPrint(followFeedService.getFollowFeedList().toString());

  runApp(const FeedMeApp());
}

import 'package:feed_me/domain/models/feed_item.dart';
import 'package:feed_me/domain/models/follow_feed.dart';
import 'package:feed_me/domain/services/feed_Items_service.dart';
import 'package:feed_me/domain/services/follow_feed_service.dart';
import 'package:feed_me/provider/FeedProvider.dart';
import 'package:feed_me/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FeedMeApp extends StatelessWidget {
  const FeedMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedProvider(
        followFeedService: FollowFeedService(),
        feedItemsService: FeedItemsService(),
        child: const MaterialApp(
          title: 'FeedMe',
          home: MainPage(),
        ));
  }
}

Future<void> initializeHiveBox() async {
  /// base config
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  /// register adapter
  Hive.registerAdapter(FeedItemAdapter());
  Hive.registerAdapter(FollowFeedAdapter());

  /// open boxes
  await Hive.openBox<FeedItem>(FeedItem.hiveKey);
  await Hive.openBox<FollowFeed>(FollowFeed.hiveKey);
}

void main() async {
  await initializeHiveBox();
  runApp(const FeedMeApp());
}

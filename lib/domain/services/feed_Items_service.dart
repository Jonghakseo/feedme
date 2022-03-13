import 'package:feed_me/converter/feed_items_converter.dart';
import 'package:feed_me/domain/models/feed_item.dart';
import 'package:feed_me/domain/models/follow_feed.dart';
import 'package:feed_me/domain/repository/feed_items_repository.dart';
import 'package:feed_me/network/fetch_xml.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FeedItemsService implements FeedItemsRepository {
  late Box<FeedItem> _box;

  /// singleton
  static final FeedItemsService _instance = FeedItemsService._internal();

  factory FeedItemsService() => _instance;

  FeedItemsService._internal() {
    _box = Hive.box<FeedItem>(FeedItem.hiveKey);
  }

  @override
  void updateFeedItems(FollowFeed followFeed, List<FeedItem> feedItems) {
    var existKeys = followFeed.feedItems?.map((e) => e.key);

    if (existKeys != null) {
      _box.deleteAll(existKeys);
    }
    _box.addAll(feedItems);
    followFeed.feedItems = HiveList(_box);
    followFeed.feedItems?.addAll(feedItems);
    followFeed.save();
  }

  Future<void> updateFeedItemsFromRemote(FollowFeed followFeed) async {
    var xml = await FetchXml.fetchRssXml(followFeed.uri);
    List<FeedItem> feedItems =
        FeedItemsConverter.xmlToFeedItems(xml, followFeed.uri);
    return updateFeedItems(followFeed, feedItems);
  }

  @override
  List<FeedItem> getAllFeedItems() {
    return _box.values.toList();
  }
}

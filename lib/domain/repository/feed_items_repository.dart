import 'package:feed_me/domain/models/feed_item.dart';
import 'package:feed_me/domain/models/follow_feed.dart';

abstract class FeedItemsRepository {
  const FeedItemsRepository();

  void updateFeedItems(FollowFeed followFeed, List<FeedItem> newFeedItem);
  Future<void> updateFeedItemsFromRemote(FollowFeed followFeed);
  Future<List<FeedItem>> getFeedItemsFromRemote(String uri);
  List<FeedItem> getAllFeedItems();
}

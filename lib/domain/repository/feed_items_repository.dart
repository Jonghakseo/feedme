import 'package:feed_me/domain/models/feed_item.dart';
import 'package:feed_me/domain/models/follow_feed.dart';

abstract class FeedItemsRepository {
  const FeedItemsRepository();

  void updateFeedItems(FollowFeed followFeed, List<FeedItem> newFeedItem);
  List<FeedItem> getAllFeedItems();
}

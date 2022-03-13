import 'package:feed_me/domain/models/follow_feed.dart';

abstract class FollowFeedRepository {
  /// CRD
  void addFollowFeed(FollowFeed followFeed);
  List<FollowFeed> getFollowFeedList();
  void deleteFollowFeed(FollowFeed followFeed);
}

import 'package:feed_me/domain/models/feed_item.dart';
import 'package:feed_me/domain/models/follow_feed.dart';
import 'package:feed_me/domain/repository/feed_items_repository.dart';
import 'package:feed_me/domain/repository/follow_feed_repository.dart';
import 'package:flutter/cupertino.dart';

Future<void> _updateFeedItems(
    FollowFeedRepository followFeed, FeedItemsRepository feedItems) async {
  List<FollowFeed> followFeedList = followFeed.getFollowFeedList();
  await Future.wait(followFeedList
      .map((feed) async => await feedItems.updateFeedItemsFromRemote(feed)));
}

// String url1 = "https://d2.naver.com/d2.atom";
// String url2 = "https://nookpi.tistory.com/rss";
class FeedProvider extends InheritedWidget {
  late final FollowFeedRepository _followFeed;
  late final FeedItemsRepository _feedItems;

  FeedProvider({
    Key? key,
    required Widget child,
    required FollowFeedRepository followFeed,
    required FeedItemsRepository feedItems,
  }) : super(key: key, child: child) {
    _followFeed = followFeed;
    _feedItems = feedItems;
    _updateFeedItems(_followFeed, _feedItems);
    FeedIndexHelper._updateFeedIndexPositions(_followFeed.getFollowFeedList());
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static List<FollowFeed> followFeedList(BuildContext context) {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;
    return feedProvider._followFeed.getFollowFeedList();
  }

  static Future<void> refreshFeedList(BuildContext context) async {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;
    await _updateFeedItems(feedProvider._followFeed, feedProvider._feedItems);
  }

  static Future<void> addFollowFeed(BuildContext context, String uri) async {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;
    FollowFeed followFeed =
        await feedProvider._followFeed.getFollowFeedFromRemote(uri);
    feedProvider._followFeed.addFollowFeed(followFeed);
    feedProvider._feedItems.updateFeedItemsFromRemote(followFeed);
  }

  static FeedItem getFeedByIndex(
      BuildContext context, int followFeedIndex, int feedIndex) {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;

    var followFeed =
        feedProvider._followFeed.getFollowFeedList().elementAt(followFeedIndex);
    return followFeed.feedItems!.elementAt(feedIndex);
  }
}

class FeedIndexPosition {
  late int current;
  late int total;
  FeedIndexPosition(this.total, this.current);
}

class FeedIndexHelper {
  static late List<FeedIndexPosition> positions = [];

  static void _updateFeedIndexPositions(List<FollowFeed> feedList) {
    if (positions.isEmpty) {
      positions = feedList
          .map((feed) => FeedIndexPosition(feed.feedItems!.length, 0))
          .toList();
    } else {
      positions = positions.asMap().entries.map((entry) {
        var index = entry.key;
        var info = entry.value;
        info.total = feedList.elementAt(index).feedItems!.length;
        return info;
      }).toList();
    }
  }

  static void changeFeedPosition(int followFeedIndex, int feedIndex) {
    positions.elementAt(followFeedIndex).current = feedIndex;
  }
}

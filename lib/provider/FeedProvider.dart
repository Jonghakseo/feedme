import 'package:feed_me/domain/models/follow_feed.dart';
import 'package:feed_me/domain/services/feed_Items_service.dart';
import 'package:feed_me/domain/services/follow_feed_service.dart';
import 'package:flutter/cupertino.dart';

void updateFeedItems(
    FollowFeedService followFeedService, FeedItemsService feedItemsService) {
  List<FollowFeed> followFeedList = followFeedService.getFollowFeedList();
  Future.wait(followFeedList.map(
      (feed) async => await feedItemsService.updateFeedItemsFromRemote(feed)));
}

// String url1 = "https://d2.naver.com/d2.atom";
// String url2 = "https://nookpi.tistory.com/rss";
class FeedProvider extends InheritedWidget {
  late final FollowFeedService _followFeedService;
  late final FeedItemsService _feedItemsService;

  FeedProvider({
    Key? key,
    required Widget child,
    required FollowFeedService followFeedService,
    required FeedItemsService feedItemsService,
  }) : super(key: key, child: child) {
    _followFeedService = followFeedService;
    _feedItemsService = feedItemsService;
    updateFeedItems(_followFeedService, _feedItemsService);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static List<FollowFeed> followFeedList(BuildContext context) {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;
    return feedProvider._followFeedService.getFollowFeedList();
  }

  static void refreshFeedList(BuildContext context) {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;
    updateFeedItems(
        feedProvider._followFeedService, feedProvider._feedItemsService);
  }

  static Future<void> addFollowFeed(BuildContext context, String uri) async {
    FeedProvider feedProvider = context
        .dependOnInheritedWidgetOfExactType<FeedProvider>() as FeedProvider;
    FollowFeed followFeed =
        await feedProvider._followFeedService.getFollowFeedFromRemote(uri);
    feedProvider._followFeedService.addFollowFeed(followFeed);
    feedProvider._feedItemsService.updateFeedItemsFromRemote(followFeed);
  }
}

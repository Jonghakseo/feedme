import 'package:dart_rss/dart_rss.dart';
import 'package:feed_me/domain/models/feed_item.dart';

class FeedItemsConverter {
  FeedItemsConverter() {}

  static List<FeedItem> _rssFeedToFeedItems(RssFeed feed, String uri) {
    List<FeedItem> feedItems = feed.items
        .map((rssItem) => FeedItem(
            followFeedUri: uri,
            uri: rssItem.link,
            title: rssItem.title,
            description: rssItem.description,
            // TODO thumbnail 추출
            thumbnail: null))
        .toList();
    return feedItems;
  }

  static List<FeedItem> _atomFeedToFeedItems(AtomFeed feed, String uri) {
    List<FeedItem> feedItems = feed.items
        .map((atomItem) => FeedItem(
            followFeedUri: uri,
            uri: atomItem.links.isNotEmpty ? atomItem.links.first.href : null,
            title: atomItem.title,
            description: atomItem.content,
            // TODO thumbnail 추출
            thumbnail: null))
        .toList();
    return feedItems;
  }

  static List<FeedItem> xmlToFeedItems(String xml, String uri) {
    try {
      var rssFeed = RssFeed.parse(xml);
      return _rssFeedToFeedItems(rssFeed, uri);
    } catch (e) {
      var atomFeed = AtomFeed.parse(xml);
      return _atomFeedToFeedItems(atomFeed, uri);
    }
  }
}

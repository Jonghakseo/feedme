import 'package:dart_rss/dart_rss.dart';
import 'package:feed_me/domain/models/follow_feed.dart';

class FollowFeedConverter {
  FollowFeedConverter() {}

  static FollowFeed _rssFeedToFollowFeed(RssFeed feed, String uri) {
    return FollowFeed(
      name: feed.title,
      uri: uri,
      description: feed.description,
      image: feed.image?.url,
      editor: feed.managingEditor,
    );
  }

  static FollowFeed _atomFeedToFollowFeed(AtomFeed feed, String uri) {
    return FollowFeed(
      name: feed.title,
      uri: uri,
      description: feed.subtitle,
      image: feed.logo,
      editor: feed.authors.isNotEmpty ? feed.authors.first.name : null,
    );
  }

  static FollowFeed xmlToFollowFeed(String xml, String uri) {
    try {
      var rssFeed = RssFeed.parse(xml);
      return _rssFeedToFollowFeed(rssFeed, uri);
    } catch (e) {
      var atomFeed = AtomFeed.parse(xml);
      return _atomFeedToFollowFeed(atomFeed, uri);
    }
  }
}

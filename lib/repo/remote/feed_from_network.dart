import 'package:dart_rss/dart_rss.dart';
import 'package:dart_rss/domain/rss_feed.dart';
import 'package:feed_me/repo/models/follow_feed.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FeedFromNetwork {
  FeedFromNetwork() {}

  static bool _isValidResponse(http.Response response) {
    if (response.statusCode != 200) return false;

    String contentType = response.headers['content-type'].toString();
    if (!contentType.contains('xml')) return false;

    return true;
  }

  static Future<String> fetchRssXml() async {
    String url = "https://d2.naver.com/d2.atom";
    // String url = "https://nookpi.tistory.com/rss";

    http.Response response = await http.get(url);
    if (!_isValidResponse(response)) {
      throw Error();
    }
    return response.body;
  }

  static FollowFeed _rssFeedToFollowFeed(RssFeed feed) {
    // List<FeedItem> items = feed.items.map((e) => null)
    return FollowFeed(
        name: feed.title,
        url: feed.link,
        description: feed.description,
        image: feed.image.url,
        editor: feed.managingEditor);
  }

  static FollowFeed _atomFeedToFollowFeed(AtomFeed feed) {
    debugPrint(feed.authors.toString());
    return FollowFeed(
      name: feed.title,
      url: feed.links.isNotEmpty ? feed.links.first.href : null,
      description: feed.subtitle,
      image: feed.logo,
      editor: feed.authors.isNotEmpty ? feed.authors.first.name : null,
    );
  }

  static FollowFeed xmlToFollowFeed(String xml) {
    try {
      var rssFeed = RssFeed.parse(xml);
      return _rssFeedToFollowFeed(rssFeed);
    } catch (e) {
      var atomFeed = AtomFeed.parse(xml);
      return _atomFeedToFollowFeed(atomFeed);
    }
  }
}

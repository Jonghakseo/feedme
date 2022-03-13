import 'package:feed_me/converter/follow_feed_converter.dart';
import 'package:feed_me/domain/models/follow_feed.dart';
import 'package:feed_me/domain/repository/follow_feed_repository.dart';
import 'package:feed_me/network/fetch_xml.dart';
import 'package:hive/hive.dart';

class FollowFeedService implements FollowFeedRepository {
  late Box<FollowFeed> _box;

  /// singleton
  static final FollowFeedService _instance = FollowFeedService._internal();

  factory FollowFeedService() => _instance;

  FollowFeedService._internal() {
    _box = Hive.box<FollowFeed>(FollowFeed.hiveKey);
    // _box.clear();
  }

  @override
  void addFollowFeed(FollowFeed followFeed) {
    _box.add(followFeed);
  }

  Future<void> addFollowFeedFromRemote(String uri) async {
    String xml = await FetchXml.fetchRssXml(uri);
    FollowFeed followFeed = FollowFeedConverter.xmlToFollowFeed(xml, uri);
    addFollowFeed(followFeed);
  }

  @override
  void deleteFollowFeed(FollowFeed followFeed) {
    _box.delete(followFeed.key);
  }

  @override
  List<FollowFeed> getFollowFeedList() {
    return _box.values.toList();
  }
}

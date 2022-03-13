import 'package:hive/hive.dart';

import 'feed_item.dart';

part 'follow_feed.g.dart';

@HiveType(typeId: 0)
class FollowFeed extends HiveObject {
  static String hiveKey = 'follow_feed';

  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String uri;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String? editor;
  @HiveField(5)
  late List<FeedItem>? feedItems = [];

  FollowFeed({
    required this.name,
    required this.uri,
    required this.description,
    required this.image,
    required this.editor,
  });

  @override
  String toString() {
    var items = feedItems.toString();
    return 'name: $name / url: $uri / description: $description / image $image / items $items';
  }
}

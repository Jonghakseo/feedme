import 'package:hive/hive.dart';

part 'feed_item.g.dart';

@HiveType(typeId: 1)
class FeedItem extends HiveObject {
  static String hiveKey = 'feed_item';

  @HiveField(0)
  final String followFeedUri;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? uri;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? thumbnail;
  @HiveField(5)
  FeedItem({
    required this.followFeedUri,
    required this.title,
    required this.uri,
    required this.description,
    required this.thumbnail,
  });

  @override
  String toString() {
    return 'title: $title';
  }
}

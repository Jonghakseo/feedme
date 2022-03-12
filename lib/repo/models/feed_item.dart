class FeedItem {
  late final int id;
  final int followFeedId;
  final String title;
  final String url;
  final String description;
  final String thumbnail;

  FeedItem({
    required this.followFeedId,
    required this.title,
    required this.url,
    required this.description,
    required this.thumbnail,
  });
}

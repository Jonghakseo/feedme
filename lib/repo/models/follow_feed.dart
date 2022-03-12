class FollowFeed {
  late final int id;
  final String name;
  final String? url;
  final String description;
  final String image;
  final String? editor;
  // final List<FeedItem>? feedItems;

  FollowFeed({
    required this.name,
    required this.url,
    required this.description,
    required this.image,
    required this.editor,
    // required this.feedItems,
  });

  @override
  String toString() {
    // var items = feedItems.toString();
    return 'name: $name / url: $url / desc: $description / image: $image / editor: $editor';
  }
}

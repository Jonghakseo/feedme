// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_feed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FollowFeedAdapter extends TypeAdapter<FollowFeed> {
  @override
  final int typeId = 0;

  @override
  FollowFeed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FollowFeed(
      name: fields[0] as String?,
      uri: fields[1] as String,
      description: fields[2] as String?,
      image: fields[3] as String?,
      editor: fields[4] as String?,
    )..feedItems = (fields[5] as List?)?.cast<FeedItem>();
  }

  @override
  void write(BinaryWriter writer, FollowFeed obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.uri)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.editor)
      ..writeByte(5)
      ..write(obj.feedItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowFeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

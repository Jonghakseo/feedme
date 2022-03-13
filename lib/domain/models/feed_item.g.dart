// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedItemAdapter extends TypeAdapter<FeedItem> {
  @override
  final int typeId = 1;

  @override
  FeedItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedItem(
      followFeedUri: fields[0] as String,
      title: fields[1] as String?,
      uri: fields[2] as String?,
      description: fields[3] as String?,
      thumbnail: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FeedItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.followFeedUri)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.uri)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

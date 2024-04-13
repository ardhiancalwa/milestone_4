// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapterAdapter extends TypeAdapter<MovieAdapter> {
  @override
  final int typeId = 0;

  @override
  MovieAdapter read(BinaryReader reader) {
    return MovieAdapter();
  }

  @override
  void write(BinaryWriter writer, MovieAdapter obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

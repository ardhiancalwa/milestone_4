import 'package:hive/hive.dart';
import 'movie.dart';

part 'movie_adapter.g.dart';

@HiveType(typeId: 0) // Changed HiveAdapter to HiveType
class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) { // Changed deserialize to read
    return Movie(
      id: reader.readInt(),
      title: reader.readString(),
      overview: reader.readString(),
      posterPath: reader.readString(),
      backdropPath: reader.readString(),
      voteAverage: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) { // Changed serialize to write
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.overview);
    writer.writeString(obj.posterPath);
    writer.writeString(obj.backdropPath);
    writer.writeDouble(obj.voteAverage);
  }
}

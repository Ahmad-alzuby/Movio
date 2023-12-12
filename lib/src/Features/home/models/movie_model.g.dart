// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      id: fields[2] as int?,
      originalLanguage: fields[4] as String?,
      originalTitle: fields[5] as String?,
      overview: fields[6] as String?,
      posterPath: fields[7] as String?,
      mediaType: fields[8] as String?,
      genreIds: (fields[9] as List?)?.cast<dynamic>(),
      popularity: fields[10] as double?,
      releaseDate: fields[11] as String?,
      video: fields[12] as bool?,
      voteAverage: fields[13] as double?,
      voteCount: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.mediaType)
      ..writeByte(9)
      ..write(obj.genreIds)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.releaseDate)
      ..writeByte(12)
      ..write(obj.video)
      ..writeByte(13)
      ..write(obj.voteAverage)
      ..writeByte(14)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

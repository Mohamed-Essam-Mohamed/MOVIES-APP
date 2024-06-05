// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_respons_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsResponseDtoAdapter
    extends TypeAdapter<MovieDetailsResponseDto> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsResponseDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsResponseDto(
      id: fields[0] as int?,
      posterPath: fields[1] as String?,
      releaseDate: fields[2] as String?,
      title: fields[3] as String?,
      voteAverage: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsResponseDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsResponseDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}


import 'package:hive_flutter/adapters.dart';
part 'movie_model.g.dart';
@HiveType(typeId: 0)
class MovieModel {
  @HiveField(0)
  bool? adult;
  @HiveField(1)

  String? backdropPath;
  @HiveField(2)

  @HiveField(3)
  int? id;
  String? title;
  @HiveField(4)

  String? originalLanguage;
  @HiveField(5)
  String? originalTitle;
  @HiveField(6)
  String? overview;
  @HiveField(7)
  String? posterPath;
  @HiveField(8)
  String? mediaType;
  @HiveField(9)
  List<dynamic>? genreIds;
  @HiveField(10)
  double? popularity;
  @HiveField(11)
  String? releaseDate;
  @HiveField(12)
  bool? video;
  @HiveField(13)
  double? voteAverage;
  @HiveField(14)
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        posterPath: json['poster_path'] as String?,
        mediaType: json['media_type'] as String?,
        genreIds: json['genre_ids'] as List<dynamic>?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        releaseDate: json['release_date'] as String?,
        video: json['video'] as bool?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'id': id,
        'title': title,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'media_type': mediaType,
        'genre_ids': genreIds,
        'popularity': popularity,
        'release_date': releaseDate,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}

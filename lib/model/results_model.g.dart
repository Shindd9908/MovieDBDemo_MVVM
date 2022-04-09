// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ResultsModelCopyWith on ResultsModel {
  ResultsModel copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return ResultsModel(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsModel _$ResultsModelFromJson(Map json) {
  return ResultsModel(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    id: json['id'] as int?,
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    releaseDate: json['release_date'] as String?,
    title: json['title'] as String?,
    video: json['video'] as bool?,
    voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    voteCount: json['voteCount'] as int?,
  );
}

Map<String, dynamic> _$ResultsModelToJson(ResultsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adult', instance.adult);
  writeNotNull('backdrop_path', instance.backdropPath);
  writeNotNull('genre_ids', instance.genreIds);
  writeNotNull('id', instance.id);
  writeNotNull('original_language', instance.originalLanguage);
  writeNotNull('original_title', instance.originalTitle);
  writeNotNull('overview', instance.overview);
  writeNotNull('popularity', instance.popularity);
  writeNotNull('poster_path', instance.posterPath);
  writeNotNull('release_date', instance.releaseDate);
  writeNotNull('title', instance.title);
  writeNotNull('video', instance.video);
  writeNotNull('voteAverage', instance.voteAverage);
  writeNotNull('voteCount', instance.voteCount);
  return val;
}

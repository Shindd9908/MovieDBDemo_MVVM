import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../app_config.dart';
part 'results_model.g.dart';

@CopyWith(generateCopyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class ResultsModel {
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  ResultsModel({this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount});

  String get imageUrl {
    return backdropPath != null ? AppConfig.prefixUrl + backdropPath! : '';
  }

  factory ResultsModel.fromJson(Map<String, dynamic> json) => _$ResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsModelToJson(this);
}
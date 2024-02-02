import 'package:core/data/models/tv_episode_model.dart';
import 'package:core/domain/entities/tv_season.dart';
import 'package:equatable/equatable.dart';

class TvSeasonModel extends Equatable {
  TvSeasonModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.tvSeasonModelId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final String id;
  final DateTime? airDate;
  final List<TvEpisodeModel> episodes;
  final String name;
  final String overview;
  final int tvSeasonModelId;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

  factory TvSeasonModel.fromJson(Map<String, dynamic> json) => TvSeasonModel(
        id: json["_id"],
        airDate: DateTime.tryParse(json["air_date"].toString()),
        episodes: List<TvEpisodeModel>.from(
            json["episodes"].map((x) => TvEpisodeModel.fromJson(x))),
        name: json["name"],
        overview: json["overview"],
        tvSeasonModelId: json["id"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
        voteAverage: json["vote_average"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "air_date":
            "${airDate?.year.toString().padLeft(4, '0')}-${airDate?.month.toString().padLeft(2, '0')}-${airDate?.day.toString().padLeft(2, '0')}",
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": tvSeasonModelId,
        "poster_path": posterPath,
        "season_number": seasonNumber,
        "vote_average": voteAverage,
      };

  TvSeason toEntity() {
    return TvSeason(
        id: this.id,
        airDate: this.airDate,
        episodes: this.episodes.map((episodes) => episodes.toEntity()).toList(),
        name: this.name,
        overview: this.overview,
        tvSeasonModelId: this.tvSeasonModelId,
        posterPath: this.posterPath,
        seasonNumber: this.seasonNumber,
        voteAverage: this.voteAverage);
  }

  @override
  List<Object?> get props => [
        id,
        airDate,
        episodes,
        name,
        overview,
        tvSeasonModelId,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}

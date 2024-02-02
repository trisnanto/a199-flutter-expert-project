import 'package:core/domain/entities/tv_episode.dart';
import 'package:equatable/equatable.dart';

class TvSeason extends Equatable {
  TvSeason({
    required this.id,
    this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.tvSeasonModelId,
    this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final String id;
  final DateTime? airDate;
  final List<TvEpisode> episodes;
  final String name;
  final String overview;
  final int tvSeasonModelId;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

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

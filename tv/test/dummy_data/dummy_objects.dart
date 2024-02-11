import 'package:tv/data/models/tv_table.dart';
import 'package:tv/domain/entities/genre.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/entities/tv_detail.dart';
import 'package:tv/domain/entities/tv_episode.dart';
import 'package:tv/domain/entities/tv_season.dart';

final testTv = Tv(
  adult: false,
  backdropPath: "/path.jpg",
  firstAirDate: "2024-01-02",
  genreIds: [1, 2, 3, 4],
  id: 1,
  name: "name",
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "Original Name",
  overview: "overview",
  popularity: 5.0,
  posterPath: "posterPath",
  voteAverage: 1.0,
  voteCount: 5,
);

final testTvList = [testTv];

final testTvDetail = TvDetail(
  adult: false,
  backdropPath: "/path.jpg",
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  name: "name",
  numberOfEpisodes: 10,
  numberOfSeasons: 2,
  originalName: "Original Name",
  overview: "overview",
  posterPath: "posterPath",
  voteAverage: 5.0,
  voteCount: 100,
);
final testTvSeason = TvSeason(
  id: "1",
  name: "name",
  episodes: [
    TvEpisode(
      airDate: DateTime.parse("2024-01-01"),
      episodeNumber: 1,
      episodeType: "type",
      id: 1,
      name: "name",
      overview: "overview",
      productionCode: "productionCode",
      runtime: 120,
      seasonNumber: 1,
      showId: 1,
      stillPath: "stillPath",
      voteAverage: 1.0,
      voteCount: 10,
    )
  ],
  overview: "overview",
  posterPath: "posterPath",
  voteAverage: 5.0,
  tvSeasonModelId: 1,
  seasonNumber: 1,
);

final testWatchlistTv = Tv.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvTable = TvTable.fromEntity(testTvDetail);

final testTvMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};

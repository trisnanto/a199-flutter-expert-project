import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvModel = TvModel(
    adult: false,
    backdropPath: "/path.jpg",
    firstAirDate: "2024-01-02",
    genreIds: [1, 2, 3, 4],
    id: 1,
    name: "Name",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Original Name",
    overview: "Overview",
    popularity: 5.0,
    posterPath: "/path.jpg",
    voteAverage: 1.0,
    voteCount: 5,
  );

  final tTv = Tv(
    adult: false,
    backdropPath: "/path.jpg",
    firstAirDate: "2024-01-02",
    genreIds: [1, 2, 3, 4],
    id: 1,
    name: "Name",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Original Name",
    overview: "Overview",
    popularity: 5.0,
    posterPath: "/path.jpg",
    voteAverage: 1.0,
    voteCount: 5,
  );

  test('should be a subclass of Tv entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}

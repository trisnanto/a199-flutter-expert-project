import 'package:dartz/dartz.dart';
import 'package:tv/utils/failure.dart';
import 'package:tv/utils/state_enum.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/usecases/get_now_playing_tv.dart';
import 'package:tv/presentation/provider/now_playing_tv_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'now_playing_tv_notifier_test.mocks.dart';

@GenerateMocks([GetNowPlayingTv])
void main() {
  late MockGetNowPlayingTv mockGetNowPlayingTv;
  late NowPlayingTvNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTv = MockGetNowPlayingTv();
    notifier = NowPlayingTvNotifier(getNowPlayingTv: mockGetNowPlayingTv)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTv = Tv(
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

  final tTvList = <Tv>[tTv];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetNowPlayingTv.execute()).thenAnswer((_) async => Right(tTvList));
    // act
    notifier.fetchNowPlayingTv();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change TV Series data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetNowPlayingTv.execute()).thenAnswer((_) async => Right(tTvList));
    // act
    await notifier.fetchNowPlayingTv();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tv, tTvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetNowPlayingTv.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchNowPlayingTv();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}

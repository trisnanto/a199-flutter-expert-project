import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_season.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/utils/failure.dart';

class GetTvSeason {
  final TvRepository repository;

  GetTvSeason(this.repository);

  Future<Either<Failure, TvSeason>> execute(int id, int season) {
    return repository.getTvSeason(id, season);
  }
}

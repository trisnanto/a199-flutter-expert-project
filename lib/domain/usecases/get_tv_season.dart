import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_season.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetTvSeason {
  final TvRepository repository;

  GetTvSeason(this.repository);

  Future<Either<Failure, TvSeason>> execute(int id, int season) {
    return repository.getTvSeason(id, season);
  }
}

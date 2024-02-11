import 'package:tv/data/models/tv_season_model.dart';
import 'package:equatable/equatable.dart';

class TvSeasonResponse extends Equatable {
  final List<TvSeasonModel> episodeList;

  TvSeasonResponse({required this.episodeList});

  factory TvSeasonResponse.fromJson(Map<String, dynamic> json) =>
      TvSeasonResponse(
        episodeList: List<TvSeasonModel>.from((json["results"] as List)
            .map((x) => TvSeasonModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "episodes": List<dynamic>.from(episodeList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [episodeList];
}

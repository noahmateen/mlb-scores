import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:mlb_scores/game_details/bloc/bloc.dart';
import 'package:mlb_scores/models/models.dart';
import 'package:mlb_scores/repositories/mlb_repository.dart';

class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  final MLBRepository mlbRepository;

  GameDetailsBloc({
    @required this.mlbRepository,
  }) : assert(mlbRepository != null);

  @override
  GameDetailsState get initialState => GameDetailsLoading();

  @override
  Stream<GameDetailsState> mapEventToState(GameDetailsEvent event) async* {
    if (event is FetchGameDetails) {
      yield GameDetailsLoading();
      try {
        final LineScoreModel lineScore =
            await mlbRepository.getGameLineScore(event.gameId);
        yield GameDetailsLoaded(
          lineScore: lineScore,
        );
      } catch (_) {
        yield GameDetailsError();
      }
    }
  }
}

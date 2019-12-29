import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:mlb_scores/games/bloc/bloc.dart';
import 'package:mlb_scores/models/models.dart';
import 'package:mlb_scores/repositories/mlb_repository.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final MLBRepository mlbRepository;

  GamesBloc({
    @required this.mlbRepository,
  }) : assert(mlbRepository != null);

  @override
  GamesState get initialState => GamesLoading();

  @override
  Stream<GamesState> mapEventToState(GamesEvent event) async* {
    if (event is FetchGames) {
      yield GamesLoading();
      try {
        final List<GameModel> games = await mlbRepository.getGames();
        yield GamesLoaded(games: games);
      } catch (_) {
        yield GamesError();
      }
    }
  }
}

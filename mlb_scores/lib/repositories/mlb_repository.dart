import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mlb_scores/models/models.dart';
import 'package:mlb_scores/repositories/repositories.dart';

class MLBRepository {
  final MLBApiClient mlbApiClient;

  MLBRepository({@required this.mlbApiClient}) : assert(mlbApiClient != null);

  Future<List<GameModel>> getGames() async {
    final games = await mlbApiClient.getGames();
    return games;
  }

  Future<LineScoreModel> getGameLineScore(int id) async {
    final gameDetails = await mlbApiClient.getGameLineScore(id);
    return gameDetails;
  }
}

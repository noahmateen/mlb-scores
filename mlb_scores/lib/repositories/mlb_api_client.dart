import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:mlb_scores/models/inning.dart';
import 'package:mlb_scores/models/models.dart';
import 'package:mlb_scores/utils/utils.dart';

class MLBApiClient {
  static const String BASE_URL = 'https://statsapi.mlb.com/api/v1';

  Future<List<GameModel>> getGames() async {
    final gamesUrl = '$BASE_URL/schedule/?sportId=1&date=09/29/2019';
    final http.Response gamesResponse = await http.get(gamesUrl);
    if (gamesResponse.statusCode != 200) {
      throw Exception('error getting games for given date');
    }

    final gamesJson = jsonDecode(gamesResponse.body);
    final games = gamesJson['dates'][0]['games'];
    List<GameModel> formattedGames = [];

    games.forEach((game) {
      int gamePk = game['gamePk'];
      String gameStatus = game['status']['detailedState'];

      int homeTeamScore = game['teams']['home']['score'];
      int homeTeamId = game['teams']['home']['team']['id'];
      String homeTeamNameShort = TeamNames.getTeamAbbreviation(homeTeamId);

      int awayTeamScore = game['teams']['away']['score'];
      int awayTeamId = game['teams']['away']['team']['id'];
      String awayTeamNameShort = TeamNames.getTeamAbbreviation(awayTeamId);

      GameModel gameModel = GameModel(
        gamePk: gamePk,
        gameStatus: gameStatus,
        homeTeamScore: homeTeamScore,
        homeTeamId: homeTeamId,
        homeTeamNameShort: homeTeamNameShort,
        awayTeamScore: awayTeamScore,
        awayTeamId: awayTeamId,
        awayTeamNameShort: awayTeamNameShort,
      );

      formattedGames.add(gameModel);
    });

    return formattedGames;
  }

  Future<LineScoreModel> getGameLineScore(int id) async {
    final lineScoreUrl = '$BASE_URL/game/567139/linescore';
    final http.Response lineScoreResponse = await http.get(lineScoreUrl);
    if (lineScoreResponse.statusCode != 200) {
      throw Exception('error getting line score for given game');
    }

    final lineScoreJson = jsonDecode(lineScoreResponse.body);
    final innings = lineScoreJson['innings'];

    int homeTotalRuns = 0;
    int homeTotalHits = 0;
    int homeTotalErrors = 0;

    int awayTotalRuns = 0;
    int awayTotalHits = 0;
    int awayTotalErrors = 0;

    List<InningModel> inningResults = [];

    innings.forEach((inning) {
      int currentInning = inning['num'];

      int homeTeamRuns = inning['home']['runs'];
      homeTotalRuns += homeTeamRuns;
      int homeTeamHits = inning['home']['runs'];
      homeTotalHits = homeTeamHits;
      int homeTeamErrors = inning['home']['errors'];
      homeTotalErrors += homeTeamErrors;

      int awayTeamRuns = inning['away']['runs'];
      awayTotalRuns += awayTeamRuns;
      int awayTeamHits = inning['away']['runs'];
      awayTotalHits = awayTeamHits;
      int awayTeamErrors = inning['away']['errors'];
      awayTotalErrors += awayTeamErrors;

      final results = InningModel(
        inning: currentInning,
        homeTeamRuns: homeTeamRuns,
        awayTeamRuns: awayTeamRuns,
      );

      inningResults.add(results);
    });

    final lineScore = LineScoreModel(
      innings: inningResults,
      homeTeamTotalRuns: homeTotalRuns,
      awayTeamTotalRuns: awayTotalRuns,
      homeTeamTotalHits: homeTotalHits,
      awayTeamTotalHits: awayTotalHits,
      homeTeamTotalErrors: homeTotalErrors,
      awayTeamTotalErrors: awayTotalErrors,
    );

    return lineScore;
  }
}

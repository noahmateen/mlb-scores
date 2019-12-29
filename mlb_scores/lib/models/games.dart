import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GameModel extends Equatable {
  final int gamePk;
  final String gameStatus;

  final int homeTeamScore;
  final int homeTeamId;
  final String homeTeamNameShort;

  final int awayTeamScore;
  final int awayTeamId;
  final String awayTeamNameShort;

  GameModel({
    @required this.gamePk,
    @required this.gameStatus,
    @required this.homeTeamScore,
    @required this.homeTeamId,
    @required this.homeTeamNameShort,
    @required this.awayTeamScore,
    @required this.awayTeamId,
    @required this.awayTeamNameShort,
  });

  @override
  List<Object> get props => [
        gamePk,
        gameStatus,
        homeTeamScore,
        homeTeamId,
        homeTeamNameShort,
        awayTeamScore,
        awayTeamId,
        awayTeamNameShort,
      ];
}

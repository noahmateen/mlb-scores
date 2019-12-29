import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mlb_scores/models/models.dart';

class LineScoreModel extends Equatable {
  final List<InningModel> innings;
  final int homeTeamTotalRuns;
  final int awayTeamTotalRuns;
  final int homeTeamTotalHits;
  final int awayTeamTotalHits;
  final int homeTeamTotalErrors;
  final int awayTeamTotalErrors;

  LineScoreModel({
    @required this.innings,
    @required this.homeTeamTotalRuns,
    @required this.awayTeamTotalRuns,
    @required this.homeTeamTotalHits,
    @required this.awayTeamTotalHits,
    @required this.homeTeamTotalErrors,
    @required this.awayTeamTotalErrors,
  });

  @override
  List<Object> get props => [
        innings,
        homeTeamTotalRuns,
        awayTeamTotalRuns,
        homeTeamTotalHits,
        awayTeamTotalHits,
        homeTeamTotalErrors,
        awayTeamTotalErrors,
      ];
}

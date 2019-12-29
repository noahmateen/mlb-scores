import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class InningModel extends Equatable {
  final int inning;
  final int homeTeamRuns;
  final int awayTeamRuns;

  InningModel({
    @required this.inning,
    @required this.homeTeamRuns,
    @required this.awayTeamRuns,
  });

  @override
  List<Object> get props => [
        inning,
        homeTeamRuns,
        awayTeamRuns,
      ];
}

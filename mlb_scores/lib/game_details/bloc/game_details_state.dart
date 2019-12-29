import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mlb_scores/models/models.dart';

abstract class GameDetailsState extends Equatable {
  const GameDetailsState();

  @override
  List<Object> get props => [];
}

class GameDetailsLoading extends GameDetailsState {}

class GameDetailsLoaded extends GameDetailsState {
  final LineScoreModel lineScore;

  const GameDetailsLoaded({
    @required this.lineScore,
  }) : assert(lineScore != null);

  @override
  List<Object> get props => [lineScore];
}

class GameDetailsError extends GameDetailsState {}

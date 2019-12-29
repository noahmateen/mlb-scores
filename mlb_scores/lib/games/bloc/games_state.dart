import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mlb_scores/models/models.dart';

abstract class GamesState extends Equatable {
  const GamesState();

  @override
  List<Object> get props => [];
}

class GamesLoading extends GamesState {}

class GamesLoaded extends GamesState {
  final List<GameModel> games;

  const GamesLoaded({
    @required this.games,
  }) : assert(games != null);

  @override
  List<Object> get props => [games];
}

class GamesError extends GamesState {}

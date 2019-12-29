import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class GameDetailsEvent extends Equatable {}

class FetchGameDetails extends GameDetailsEvent {
  final int gameId;

  FetchGameDetails({
    @required this.gameId,
  }) : assert(gameId != null);

  @override
  List<Object> get props => [gameId];
}

import 'package:equatable/equatable.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();
}

class FetchGames extends GamesEvent {
  @override
  List<Object> get props => [];
}

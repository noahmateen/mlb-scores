import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlb_scores/game_details/bloc/bloc.dart';
import 'package:mlb_scores/games/bloc/games_bloc.dart';
import 'package:mlb_scores/games/bloc/games_event.dart';
import 'package:mlb_scores/games/games_page.dart';
import 'package:mlb_scores/repositories/repositories.dart';

void main() {
  final MLBRepository mlbRepository = MLBRepository(
    mlbApiClient: MLBApiClient(),
  );
  runApp(
    RepositoryProvider(
      create: (BuildContext context) => mlbRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GamesBloc>(
            create: (context) => GamesBloc(
              mlbRepository: mlbRepository,
            )..add(FetchGames()),
          ),
          BlocProvider<GameDetailsBloc>(
            create: (context) => GameDetailsBloc(
              mlbRepository: mlbRepository,
            ),
          )
        ],
        child: App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MLB Scores',
      theme: ThemeData(primaryColor: Colors.black),
      home: GamesPage(),
    );
  }
}

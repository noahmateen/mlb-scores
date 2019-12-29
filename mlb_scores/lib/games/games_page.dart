import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlb_scores/games/bloc/bloc.dart';
import 'package:mlb_scores/widgets/game_widget.dart';

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Today\'s Games'),
        ),
        body: Center(
          child: BlocBuilder<GamesBloc, GamesState>(
            builder: (context, state) {
              if (state is GamesLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is GamesError) {
                return Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.red),
                );
              }

              final games = (state as GamesLoaded).games;
              return ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return Game(
                    game: game,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

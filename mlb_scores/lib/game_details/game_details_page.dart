import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlb_scores/game_details/bloc/bloc.dart';
import 'package:mlb_scores/models/models.dart';
import 'package:mlb_scores/widgets/widgets.dart';

class GameDetails extends StatelessWidget {
  final GameModel game;

  GameDetails({
    @required this.game,
  }) : assert(game != null);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GameDetailsBloc>(context)
      ..add(
        FetchGameDetails(
          gameId: game.gamePk,
        ),
      );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${game.awayTeamNameShort} @ ${game.homeTeamNameShort}'),
        ),
        body: BlocBuilder<GameDetailsBloc, GameDetailsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GameSummary(
                          game: game,
                        ),
                      ),
                    ],
                  ),
                  if (state is GameDetailsLoaded)
                    LineScoreTable(
                      homeTeam: game.homeTeamNameShort,
                      awayTeam: game.awayTeamNameShort,
                      lineScoreModel: state.lineScore,
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: ToggleButtons(
                      isSelected: [true, false],
                      borderRadius: BorderRadius.circular(50),
                      borderWidth: 2,
                      borderColor: Colors.black,
                      selectedBorderColor: Colors.black,
                      fillColor: Colors.black,
                      splashColor: Colors.black,
                      selectedColor: Colors.white,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 36,
                          ),
                          child: Container(
                            width: 60,
                            child: Center(
                              child: Text(
                                game.awayTeamNameShort,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 36,
                          ),
                          child: Container(
                            width: 60,
                            child: Center(
                              child: Text(
                                game.homeTeamNameShort,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        print(index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

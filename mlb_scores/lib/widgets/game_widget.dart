import 'package:flutter/material.dart';
import 'package:mlb_scores/game_details/game_details_page.dart';
import 'package:mlb_scores/models/models.dart';

class Game extends StatelessWidget {
  final GameModel game;

  Game({
    @required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameDetails(
              game: game,
            ),
          ),
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage(
                                  'assets/images/${game.homeTeamId}.png'),
                            ),
                          ),
                        ),
                        Text(
                          game.homeTeamNameShort,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "${game.homeTeamScore}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                game.gameStatus,
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "${game.awayTeamScore}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8,
                          ),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage(
                                  'assets/images/${game.awayTeamId}.png'),
                            ),
                          ),
                        ),
                        Text(
                          game.awayTeamNameShort,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mlb_scores/models/models.dart';

class GameSummary extends StatelessWidget {
  final GameModel game;

  GameSummary({
    @required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      image: AssetImage('assets/images/${game.awayTeamId}.png'),
                    ),
                  ),
                ),
                Text(
                  game.awayTeamNameShort,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "${game.awayTeamScore}",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  game.gameStatus,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "${game.homeTeamScore}",
                  style: TextStyle(fontSize: 24),
                ),
              ],
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
                      image: AssetImage('assets/images/${game.homeTeamId}.png'),
                    ),
                  ),
                ),
                Text(
                  game.homeTeamNameShort,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

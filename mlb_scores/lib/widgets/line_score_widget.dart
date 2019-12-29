import 'package:flutter/material.dart';
import 'package:mlb_scores/models/line_score.dart';

class LineScoreTable extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final LineScoreModel lineScoreModel;

  LineScoreTable({
    @required this.homeTeam,
    @required this.awayTeam,
    @required this.lineScoreModel,
  })  : assert(homeTeam != null),
        assert(awayTeam != null),
        assert(lineScoreModel != null);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        top: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1,
        ),
        bottom: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1,
        ),
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _buildTableRow([
          '',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          'R',
          'H',
          'E',
        ], true),
        _buildTableRow([
          '$awayTeam',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '${lineScoreModel.awayTeamTotalRuns}',
          '${lineScoreModel.awayTeamTotalHits}',
          '${lineScoreModel.awayTeamTotalErrors}',
        ], false),
        _buildTableRow([
          '$homeTeam',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          '${lineScoreModel.homeTeamTotalRuns}',
          '${lineScoreModel.homeTeamTotalHits}',
          '${lineScoreModel.homeTeamTotalErrors}',
        ], false),
      ],
    );
  }

  TableRow _buildTableRow(List<String> items, bool isHeader) {
    return TableRow(
      children: items.map((val) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isHeader ? Colors.grey : Colors.white,
          ),
          child: Text(
            val,
            style: TextStyle(
              fontSize: 14,
              fontWeight: (isHeader && (val == 'R' || val == 'H' || val == 'E'))
                  ? FontWeight.bold
                  : FontWeight.w400,
            ),
            softWrap: false,
          ),
        );
      }).toList(),
    );
  }
}

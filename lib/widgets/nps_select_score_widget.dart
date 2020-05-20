import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/widgets/score_slider.dart';

class NpsSelectScoreWidget extends StatefulWidget {
  final int score;
  final VoidCallback onClosePressed;
  final VoidCallback onSendButtonPressed;
  final void Function(int score) onScoreChanged;

  NpsSelectScoreWidget({
    Key key,
    this.onSendButtonPressed,
    this.onClosePressed,
    this.onScoreChanged,
    this.score,
  }) : super(key: key);

  @override
  NpsSelectScoreWidgetState createState() => new NpsSelectScoreWidgetState();
}

class NpsSelectScoreWidgetState extends State<NpsSelectScoreWidget> {
  int _currentScore;

  @override
  void initState() {
    super.initState();
    _currentScore = this.widget.score;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new SizedBox(
              height: 18.0,
              width: 18.0,
              child: new IconButton(
                  padding: new EdgeInsets.all(0.0),
                  icon: new Icon(Icons.clear, size: 18.0),
                  onPressed: () {
                    if (this.widget.onClosePressed != null) {
                      this.widget.onClosePressed();
                    }
                  }),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "How likely are you to recommaned the XXX app to a ferind or colleague?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        ScoreSlider(
          maxScore: 10,
          minScore: 0,
          score: _currentScore,
          onScorChanged: (int newScore) {
            setState(() => _currentScore = newScore);
            this.widget.onScoreChanged(_currentScore);
          },
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            if (this._currentScore != null) {
              this.widget.onSendButtonPressed();
            }
          },
          child: Text("SEND"),
          color: Colors.grey,
        )
      ],
    );
  }
}

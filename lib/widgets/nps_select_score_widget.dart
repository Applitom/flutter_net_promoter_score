import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/model/nps_survey_texts.dart';
import 'package:flutter_net_promoter_score/widgets/score_slider.dart';
import 'package:flutter_net_promoter_score/model/promoter_type.dart';

class NpsSelectScoreWidget extends StatefulWidget {
  final int score;
  final VoidCallback onClosePressed;
  final VoidCallback onSendButtonPressed;
  final void Function(int score) onScoreChanged;
  final NpsSelectScorePageTexts texts;

  NpsSelectScoreWidget({
    Key key,
    @required this.texts,
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

  List<Widget> _numbers() {
    List<Widget> numbers = List<Widget>();

    for (var i = 0; i <= 10; i++) {
      numbers.add(
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                i.toString(),
                style: TextStyle(
                    fontWeight: i == _currentScore
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: i == _currentScore ? Colors.blueGrey : Colors.black),
              ),
            ),
            color: Colors.transparent,
          ),
        ),
      );
    }

    return numbers;
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
              height: 22.0,
              width: 22.0,
              child: new IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.yellow,
                  padding: new EdgeInsets.all(0.0),
                  icon: new Icon(Icons.close, size: 22.0),
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
          this.widget.texts.surveyQuestionText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: _numbers(),
        ),
        SizedBox(
          height: 5,
        ),
        ScoreSlider(
          maxScore: 10,
          minScore: 0,
          height: 35,
          score: _currentScore,
          onScorChanged: (int newScore) {
            setState(() => _currentScore = newScore);
            this.widget.onScoreChanged(_currentScore);
          },
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  this.widget.texts.detractorScoreLabelText,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        _currentScore.toPromoterType() == PromoterType.detractor
                            ? Colors.blueGrey
                            : Colors.black,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  this.widget.texts.promoterScoreLabelText,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        _currentScore.toPromoterType() == PromoterType.promoter
                            ? Colors.blueGrey
                            : Colors.black,
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ButtonTheme(
          minWidth: 150,
          height: 45,
          child: RaisedButton(
            onPressed: this._currentScore == null // Enable the button only if the user selected score
                ? null
                : () {
                      this.widget.onSendButtonPressed();
                  },
            child: Text(this.widget.texts.submitButtonText),
            color: Colors.grey,
            splashColor: Colors.transparent,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

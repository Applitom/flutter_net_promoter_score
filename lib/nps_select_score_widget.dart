import 'package:flutter/material.dart';

class NpsSelectScoreWidget extends StatefulWidget {
  

  final int score;
  final VoidCallback onSendButtonPressed;
  final void Function(int score) onScoreChanged;

  NpsSelectScoreWidget(
      {Key key, this.onSendButtonPressed, this.onScoreChanged, this.score}) : super(key: key);

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
        Slider(
          onChanged: (double value) {
            int newScore = value.toInt();
            if (this.widget.score != newScore) {
              setState(() {
                _currentScore = value.toInt();
              });
              this.widget.onScoreChanged(_currentScore);
            }
          },
          value: _currentScore != null ? _currentScore.toDouble() : 0,
          min: 0.0,
          max: 10.0,
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            this.widget.onSendButtonPressed();
          },
          child: Text("SEND"),
          color: Colors.grey,
        )
      ],
    );
  }
}

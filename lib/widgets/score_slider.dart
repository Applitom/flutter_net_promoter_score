import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  final double height;
  final int score;
  final int maxScore;
  final int minScore;
  final Color thumbColor;
  final Color scoreDotColor;
  final Color backgroundColor;

  final Function(int value) onScorChanged;

  ScoreSlider({
    @required this.maxScore,
    @required this.minScore,
    this.score,
    this.onScorChanged,
    this.height = 30,
    this.thumbColor = Colors.white,
    this.scoreDotColor = Colors.white,
    this.backgroundColor = Colors.black,
  })  : assert(maxScore != null),
        assert(minScore != null);

  @override
  State<StatefulWidget> createState() => ScoreSliderState();
}

class ScoreSliderState extends State<ScoreSlider> {
  int _currentScore;

  @override
  void initState() {
    super.initState();
    _currentScore = this.widget.score;
  }

  List<Widget> _dots(BoxConstraints size) {
    List<Widget> dots = List<Widget>();

    double width = size.maxWidth / (this.widget.maxScore - this.widget.minScore + 1);
    double selectedScoreWidth = this.widget.height * 0.75;
    double dotWidth = this.widget.height * 0.25;

    for (var i = this.widget.minScore; i <= this.widget.maxScore; i++) {
      
      double currentWidth = i == _currentScore ? selectedScoreWidth : dotWidth;
      dots.add(
        Container(
          width: width,
          child: Center(
            child: SizedBox(
              width: currentWidth,
              height: currentWidth,
              child: CircleAvatar(
                backgroundColor: i == _currentScore
                    ? this.widget.thumbColor
                    : this.widget.scoreDotColor,
              ),
            ),
          ),
          color: Colors.transparent,
        ),
      );
    }

    return dots;
  }

  void _handlePanGesture(BoxConstraints size, Offset localPosition) {
    double socreWidth = size.maxWidth / (this.widget.maxScore - this.widget.minScore + 1);
    double x = localPosition.dx;
    int calculatedScore = (x ~/ socreWidth) + this.widget.minScore;
    if (calculatedScore != _currentScore &&
        calculatedScore <= this.widget.maxScore &&
        calculatedScore >= 0) {
      setState(() => _currentScore = calculatedScore);
      if (this.widget.onScorChanged != null) {
        this.widget.onScorChanged(_currentScore);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, size) {
          return GestureDetector(
            onPanDown: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            onPanStart: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            onPanUpdate: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: this.widget.backgroundColor,
              ),
              height: this.widget.height,
              child: Stack(
                children: <Widget>[
                  Row(
                    children: _dots(size),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

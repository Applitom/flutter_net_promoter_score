import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  final int score;
  final int maxScore;
  final Function(int value) onScorChanged;

  ScoreSlider({@required this.maxScore, this.score, this.onScorChanged});

  @override
  State<StatefulWidget> createState() => ScoreSliderState();
}

class ScoreSliderState extends State<ScoreSlider> {
  int _currentScore;
  Color _backgroundColor = Colors.black;
  Color _valueDotsColor = Colors.grey;
  Color _thumbColor = Colors.indigo;

  @override
  void initState() {
    super.initState();
    _currentScore = this.widget.score;
  }

  List<Widget> _dots(BoxConstraints size) {
    List<Widget> dots = List<Widget>();

    double width = size.maxWidth / (this.widget.maxScore + 1);

    for (var i = 0; i <= this.widget.maxScore; i++) {
      dots.add(GestureDetector(
        onTap: () {
          setState(() => _currentScore = i);
          if (this.widget.onScorChanged != null) {
            this.widget.onScorChanged(_currentScore);
          }
        },
        child: Container(
          width: width,
          child: Center(
            child: CircleAvatar(
              maxRadius: i == _currentScore
                  ? size.maxWidth / this.widget.maxScore / 4
                  : (size.maxWidth / this.widget.maxScore) / 8,
              backgroundColor:
                  i == _currentScore ? _thumbColor : _valueDotsColor,
            ),
          ),
          color: Colors.transparent,
        ),
      ));
    }

    return dots;
  }

  void _handlePanGesture(BoxConstraints size, Offset localPosition) {
    double socreWidth = size.maxWidth / (this.widget.maxScore + 1);
    double x = localPosition.dx;
    int calculatedScore = x ~/ socreWidth;
    setState(() => _currentScore = calculatedScore);
    if (this.widget.onScorChanged != null) {
      this.widget.onScorChanged(_currentScore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, size) {
          return GestureDetector(
            onPanDown: (details){
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
                color: _backgroundColor,
              ),
              height: size.maxWidth / (this.widget.maxScore + 1),
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

library flutter_net_promoter_score;

import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/nps_feedback_widget.dart';
import 'package:flutter_net_promoter_score/nps_select_score_widget.dart';
import 'package:flutter_net_promoter_score/nps_thank_you_widget.dart';

/// Show a modal Net Promoter Score as a material design bottom sheet.
Future<T> showNetPromoterScore<T>(
    {@required BuildContext context,
    VoidCallback onClosePressed,
    Function(NetPromoterScoreResult result) onSurveyCompleted}) {
  return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FlutterNetPromoterScore(
          onClosePressed: onClosePressed,
          onSurveyCompleted: onSurveyCompleted,
        );
      });
}

enum PromoterType {
  promoter, // (9 =< Score <= 10)
  passive, // (7 =< Score <= 8)
  detractor, // (0 =< Score <= 6)
  unknown
}

class NetPromoterScoreResult {
  int score;
  String feedback;
  PromoterType promoterType = PromoterType.unknown;
}

class FlutterNetPromoterScore extends StatefulWidget {
  final VoidCallback onClosePressed;
  final void Function(NetPromoterScoreResult result) onSurveyCompleted;

  FlutterNetPromoterScore({this.onSurveyCompleted, this.onClosePressed});

  @override
  FlutterNetPromoterScoreState createState() => FlutterNetPromoterScoreState();
}

class FlutterNetPromoterScoreState extends State<FlutterNetPromoterScore> {
  int _currentScore;
  String _currentFeedbackText = "";

  int _currentPage = 0;
  List<Widget Function()> _pageBuilders = List<Widget Function()>();

  @override
  void initState() {
    super.initState();
    _pageBuilders.add(_npsSelectScoreWidgetBuilder);
    _pageBuilders.add(_npsFeedbackWidgetBuilder);
    _pageBuilders.add(_npsThankYouWidgetBuilder);    
    _currentPage = 0;
  }

  Widget _getCurrentPage() {
    return _pageBuilders[_currentPage]();
  }

  Widget _npsThankYouWidgetBuilder() {
    return NpsThankYouWidget();
  }

  Widget _npsFeedbackWidgetBuilder() {
    return NpsFeedbackWidget(
      onEditScoreButtonPressed: () {
        setState(() {
          _currentPage = 0;
        });
      },
      onSendButtonPressed: () {
        setState(() {
          _currentPage = 2;
        });

        _finilizeResult();

        // Dismiss after delay
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.pop(context);
        });
      },
      onFeedbackTextChanged: (String feedbackText) {
        print("New feedback text is $feedbackText");
        _currentFeedbackText = feedbackText;
      },
    );
  }

  Widget _npsSelectScoreWidgetBuilder() {
    return NpsSelectScoreWidget(
      onSendButtonPressed: () {
        setState(() {
          _currentPage = 1;
        });
      },
      onScoreChanged: (int score) {
        print("New score is $score");
        _currentScore = score;
      },
      score: _currentScore,
    );
  }

  void _finilizeResult() {
    NetPromoterScoreResult finalResult = NetPromoterScoreResult();
    finalResult.score = _currentScore;
    finalResult.feedback = _currentFeedbackText;
    finalResult.promoterType = PromoterType.unknown; // TODO: calculate type

    this.widget.onSurveyCompleted(finalResult);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          child: AnimatedSwitcher(
            child: _getCurrentPage(),
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final outAnimation =
                  Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                      .animate(animation);
              return ClipRect(
                child: SlideTransition(
                  position: outAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: child,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

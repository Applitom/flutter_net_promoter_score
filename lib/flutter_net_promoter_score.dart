library flutter_net_promoter_score;

import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/nps_feedback_widget.dart';
import 'package:flutter_net_promoter_score/nps_select_score_widget.dart';
import 'package:flutter_net_promoter_score/nps_thank_you_widget.dart';

/// Show a modal Net Promoter Score as a material design bottom sheet.
Future<T> showNetPromoterScore<T>({
  @required BuildContext context,
}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return FlutterNetPromoterScore();
      });
}

class FlutterNetPromoterScore extends StatefulWidget {
  @override
  FlutterNetPromoterScoreState createState() => FlutterNetPromoterScoreState();
}

class FlutterNetPromoterScoreState extends State<FlutterNetPromoterScore> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  Widget _getCurrentPage() {
    if (_currentPage == 0) {
      return NpsSelectScoreWidget(
        onSendButtonPressed: () {
          setState(() {
            _currentPage = 1;
          });
        },
      );
    } else if (_currentPage == 1) {
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
        },
      );
    } else {
      return NpsThankYouWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          child: _getCurrentPage(),
          height: 240,
        ),
      ),
    );
  }
}

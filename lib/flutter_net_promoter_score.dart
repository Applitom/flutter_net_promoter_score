library flutter_net_promoter_score;

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        height: 240,
      ),
    );
  }
}
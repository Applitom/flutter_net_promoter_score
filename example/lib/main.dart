import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/flutter_net_promoter_score.dart';
import 'package:flutter_net_promoter_score/model/nps_survey_texts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Net Promoter Score Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Net Promoter Score Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _showNPS();
    });
  }

  void _showNPS() {
    showNetPromoterScore(
      context: context,
      texts: NpsSurveyTexts(
        selectScorePageTexts: NpsSelectScorePageTexts(
          surveyQuestionText:
              "How likely are you to recommend flutter_net_promoter_score to a friend or colleague?",
        ),
      ),
      onSurveyCompleted: (result) {
        print("NPS Completed");
        print("Score: ${result.score}");
        print("Feedback: ${result.feedback}");
        print("Promoter Type: ${result.promoterType}");
      },
      onClosePressed: () {
        print("User closed the survery");
      },
      onScoreChanged: (newScore) {
        print("User changed the score to $newScore");
      },
      onFeedbackChanged: (newFeedback) {
        print("User change the feedback to $newFeedback");
      },
      thankYouIcon: Icon(
        Icons.thumb_up,
      ),
      theme: ThemeData.dark()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _showNPS();
              },
              child: Text("Show NPS"),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

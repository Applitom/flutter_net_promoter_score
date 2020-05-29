# flutter_net_promoter_score

Flutter component that presents [Net Promoter Score (NPS)](https://en.wikipedia.org/wiki/Net_Promoter) survey dialog to the user.

## Features
- Show Net Promoter Score survey
- Get user interactions call backs (such as score changes and feedback input)
- Get final survery with Score, Promoter type and feedback text.
- Support flutter themes to customize look and feel
- Customize texts

## How to use
### Installation
Add flutter_net_promoter_score to oyou project dependencies
```
dependencies:
  flutter_net_promoter_score:
```
### Show the survey
Import flutter_net_promoter_score the  you want to show the NPS Survey
```
import 'package:flutter_net_promoter_score/flutter_net_promoter_score.dart';
```
In order to show the survery call the function `showNetPromoterScore` and provide the required parameters
Example:
```
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
```

### Customize texts
### Customize look and feel

## Example Project

## Change Log
See [Change Log](./CHANGELOG.md) page.

## Author
[Tomer Shalom](http://applitom.com)
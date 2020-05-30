# flutter_net_promoter_score

A Flutter component that presents [Net Promoter Score (NPS)](https://en.wikipedia.org/wiki/Net_Promoter) survey.


## Features
- Show Net Promoter Score survey
- Get user interactions call backs (such as score changes and feedback input)
- Get final survery result with Score, Promoter type and feedback text.
- Support flutter themes to customize look and feel
- Customize all texts with your own texts.

## How to use
### Installation
Add flutter_net_promoter_score to oyou project dependencies
```yaml
dependencies:
  flutter_net_promoter_score:
```
### Show the survey
Import flutter_net_promoter_score the  you want to show the NPS Survey
```dart
import 'package:flutter_net_promoter_score/flutter_net_promoter_score.dart';
```
In order to show the survery call the function `showNetPromoterScore` and provide the required parameters
Example:
```dart
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
You can customize the component texts and set your own texts by passing the `text` parameter.
The `text` parameter contains the following members. Change this members to set you own texts.

- `selectScorePageTexts`-  Controls the first view texts: *"Select Score"* .
- `feedbackPageTexts` - Controls the second view texts: *"Feedback"*.
- `thankYouPageTexts` - Controls the last view texts: *"Thank You"*.

### Customize look and feel
`flutter_net_promoter_score` supports Flutter's themes mechanism and gets its look and feel by the app's ThemeData.
To customize the look and feel you can use the `theme` parameter and change it according to the following parameters:


## Example Project

## Change Log
See [Change Log](./CHANGELOG.md) page.

## Author
[Tomer Shalom](http://applitom.com)
# flutter_net_promoter_score

A Flutter component that presents [Net Promoter Score (NPS)](https://en.wikipedia.org/wiki/Net_Promoter) survey.


## Features
- Show Net Promoter Score survey
- Get user interactions call backs (such as score changes and feedback input)
- Get final survery result with Score, Promoter type and feedback text.
- Support flutter themes to customize look and feel
- Customize all texts with your own texts.

## Table of contents
- [How to use](#How-to-use)
  - [Installation](#Installation)
  - [Show the survey](#Show-the-survey)
  - [Customize texts](#Customize-texts)
  - [Theming](#Theming)
- [Change Log](#Change-Log)
- [Contribution](#Contribution)
- [Author](#Author)

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

### Theming
`flutter_net_promoter_score` supports Flutter's themes and gets its look and feel by the app's default Theme style.
To customize the look and feel with your favorites appearance you can use the `theme` parameter and change it according to the following parameters:

| Attributes | Type | Description  |
|--------------------|:----:|:-------------|
| `cardColor` | Color | Change Background Color |
| `textTheme.caption` | TextStyle | Labels style |
| `textTheme.subtitle2` | TextStyle | Questions and titles style |
| `bodyText1.bodyText1` | TextStyle | Score numbers text style |
| `textTheme.button` | TextStyle | Buttons text style |
| `sliderTheme.thumbColor` | Color | Selected score color |
| `buttonColor` | Color | Buttons background color|
| `focusColor` | Color | text field background color |
| `backgroundColor` | Color | Score slider background color |
| `sliderTheme.activeTickMarkColor` | Color | Score slider unselected dots color |
| `iconTheme` | IconThemeData | Close button icon and default thank you icon IconThemeData |
| `hintColor` | Color | Feedback field hint text color |

## Change Log
See [Change Log](./CHANGELOG.md) page.

## Contribution
Please file feature requests and bugs at the [issue tracker](https://github.com/applitom/flutter_net_promoter_score/issues).

## Author
[Tomer Shalom](http://applitom.com)
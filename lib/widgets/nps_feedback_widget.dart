import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/model/nps_survey_texts.dart';
import 'package:flutter_net_promoter_score/model/promoter_type.dart';

class NpsFeedbackWidget extends StatefulWidget {
  final String feedbackText;
  final VoidCallback onClosePressed;
  final VoidCallback onEditScoreButtonPressed;
  final VoidCallback onSendButtonPressed;
  final PromoterType promoterType;
  final Function(String feedbackText) onFeedbackTextChanged;
  final NpsFeedbackPageTexts texts;

  NpsFeedbackWidget({
    Key key,
    @required this.texts,
    this.onEditScoreButtonPressed,
    this.onClosePressed,
    this.onSendButtonPressed,
    this.onFeedbackTextChanged,
    this.feedbackText,
    this.promoterType,
  })  : assert(texts != null),
        super(key: key);

  @override
  NpsFeedbackWidgetState createState() => new NpsFeedbackWidgetState();
}

class NpsFeedbackWidgetState extends State<NpsFeedbackWidget> {
  final _feedbackTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _feedbackTextFieldController.addListener(_feedbackTextChanged);
    _feedbackTextFieldController.text = this.widget.feedbackText;
  }

  void _feedbackTextChanged() {
    this.widget.onFeedbackTextChanged(_feedbackTextFieldController.text);
  }

  String _hintTextForFeedbackTextField() {
    String hintText = this.widget.texts.passiveFeedbackTextFieldPlaceholderText;
    if (this.widget.promoterType != null) {
      switch (this.widget.promoterType) {
        case PromoterType.detractor:
          hintText = this.widget.texts.detractorFeedbackTextFieldPlaceholderText;
          break;
        case PromoterType.passive:
          hintText = this.widget.texts.passiveFeedbackTextFieldPlaceholderText;
          break;
        case PromoterType.promoter:
          hintText = this.widget.texts.promoterFeedbackTextFieldPlaceholderText;
          break;
        default:
          hintText = this.widget.texts.passiveFeedbackTextFieldPlaceholderText;
      }
    }
    return hintText;
  }

  String _mainTextAccordingToPromoterType() {
    String mainText = this.widget.texts.passiveMainLabelText;
    switch (this.widget.promoterType) {
      case PromoterType.detractor:
        mainText = this.widget.texts.detractorMainLabelText;
        break;
      case PromoterType.passive:
        mainText = this.widget.texts.passiveMainLabelText;
        break;
      case PromoterType.promoter:
        mainText = this.widget.texts.promoterMainLabelText;
        break;

      default:
        mainText = this.widget.texts.passiveMainLabelText;
    }
    return mainText;
  }

  @override
  Widget build(BuildContext context) {
    Widget feedbackTextField = Container(
      height: 90,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLines: 3,
        controller: _feedbackTextFieldController,
        decoration: InputDecoration.collapsed(
          hintText: _hintTextForFeedbackTextField(),
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new SizedBox(
                    height: 18.0,
                    width: 18.0,
                    child: new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Icon(Icons.clear, size: 18.0),
                        onPressed: () {
                          if (this.widget.onClosePressed != null) {
                            this.widget.onClosePressed();
                          }
                        }),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(_mainTextAccordingToPromoterType()),
          SizedBox(
            height: 10,
          ),
          feedbackTextField,
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  this.widget.onEditScoreButtonPressed();
                },
                child: Text(this.widget.texts.editScoreButtonText),
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                onPressed: () {
                  this.widget.onSendButtonPressed();
                },
                child: Text(this.widget.texts.submitButtonText),
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}

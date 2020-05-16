import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/model/promoter_type.dart';

class NpsFeedbackWidget extends StatefulWidget {
  final String feedbackText;
  final VoidCallback onEditScoreButtonPressed;
  final VoidCallback onSendButtonPressed;
  final PromoterType promoterType;

  final Function(String feedbackText) onFeedbackTextChanged;

  NpsFeedbackWidget({
    Key key,
    this.onEditScoreButtonPressed,
    this.onSendButtonPressed,
    this.onFeedbackTextChanged,
    this.feedbackText,
    this.promoterType
  }) : super(key: key);

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

  String _hintTextForFeedbackTextField(){
    String hintText = "Let us know if there's anything you want to share with us";
    if (this.widget.promoterType != null) {

    }
    return hintText;
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
          SizedBox(
            height: 10,
          ),
          Text("Thanks for your feedback!"),
          SizedBox(
            height: 10,
          ),
          feedbackTextField,
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  this.widget.onEditScoreButtonPressed();
                },
                child: Text("Edit score"),
              ),
              MaterialButton(
                onPressed: () {
                  this.widget.onSendButtonPressed();
                },
                child: Text("SEND"),
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}

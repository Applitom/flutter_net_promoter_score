import 'package:flutter/material.dart';
import 'package:flutter_net_promoter_score/model/nps_survey_texts.dart';

class NpsThankYouWidget extends StatefulWidget {
  final NpsThankYouPageTexts texts;

  NpsThankYouWidget({
    Key key,
    this.texts,
  })  : assert(texts != null),
        super(key: key);

  @override
  NpsThankYouWidgetState createState() => new NpsThankYouWidgetState();
}

class NpsThankYouWidgetState extends State<NpsThankYouWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Icon(
            Icons.done,
            size: 80,
          ),
          SizedBox(
            height: 5,
          ),
          Text(this.widget.texts.thankYouLabelText),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
    );
  }
}

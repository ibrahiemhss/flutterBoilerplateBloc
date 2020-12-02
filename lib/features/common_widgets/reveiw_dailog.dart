
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/material.dart';


class ReveiwDialog extends StatefulWidget {
  final String title;
  final String description;
  final String submitButton;
  final String alternativeButton;
  final String positiveComment;
  final String negativeComment;
  final Color accentColor;
  final double size;

  final ValueSetter<int> onSubmitPressed;
  final VoidCallback onAlternativePressed;

  ReveiwDialog(
      {
        @required this.title,
        @required this.description,
        @required this.size,
        @required this.onSubmitPressed,
        @required this.submitButton,
        this.accentColor = AppTheme.primary,
        this.alternativeButton = "",
        this.positiveComment = "",
        this.negativeComment = "",
        this.onAlternativePressed});

  @override
   createState() => new _ReveiwDialogState();
}

class _ReveiwDialogState extends State<ReveiwDialog> {
  int _rating = 0;

  List<Widget> _buildStarRatingButtons() {
    List<Widget> buttons = [];

    for (int rateValue = 1; rateValue <= 5; rateValue++) {
      final starRatingButton = IconButton(
          icon: Icon(_rating >= rateValue ? Icons.star : Icons.star_border,
              color: widget.accentColor, size: widget.size??35),
          onPressed: () {
            setState(() {
              _rating = rateValue;
            });
          });
      buttons.add(starRatingButton);
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    final String commentText =
    _rating >= 4 ? widget.positiveComment : widget.negativeComment;
    // final Color commentColor = _rating >= 4 ? AppTheme.green[600] : AppTheme.red;

    return AlertDialog(
      contentPadding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // widget.icon==null?Container()?widget.icon,
          const SizedBox(height: 15),
          Text(widget.title,
              style:AppTheme.subtitleLight),
          const SizedBox(height: 10),
          Text(
            widget.description,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildStarRatingButtons(),
          ),
          Visibility(
            visible: _rating > 0,
            child: Column(
              children: <Widget>[
                const Divider(),
                FlatButton(
                  child: Text(
                    widget.submitButton,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.accentColor,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onSubmitPressed(_rating);
                  },
                ),
                Visibility(
                  visible: commentText.isNotEmpty,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Text(
                        commentText,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible:
                  _rating <= 3 && widget.alternativeButton.isNotEmpty,
                  child: FlatButton(
                    child: Text(
                      widget.alternativeButton,
                      style: TextStyle(
                          color: widget.accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onAlternativePressed();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

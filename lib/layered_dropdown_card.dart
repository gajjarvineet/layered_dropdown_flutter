import 'package:flutter/material.dart';

//Default Constants for LayeredDropdownCard
const kDefaultCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    topLeft: Radius.circular(20.0),
  ),
);

const Color kOpenerIconDefaultSplashColour = Colors.transparent;
const Color kOpenerIconDefaultHighlightColour = Colors.transparent;
const IconData kDefaultOpenerIcon = Icons.dehaze;
const Color kDefaultOpenerIconColour = Colors.grey;
const Color kDefaultCardColour = Colors.white;
const double kDefaultCardElevation = 40.0;

//LayeredDropdownCard Widget
class LayeredDropdownCard extends StatefulWidget {
  LayeredDropdownCard({
    @required this.onOpenerIconClicked,
    this.child,
    this.openerIcon = kDefaultOpenerIcon,
    this.openerIconColor = kDefaultOpenerIconColour,
    this.openerIconSplashColor = kOpenerIconDefaultSplashColour,
    this.openerIconHighlightColor = kOpenerIconDefaultHighlightColour,
    this.shape = kDefaultCardShape,
    this.cardColor = kDefaultCardColour,
    this.cardElevation = kDefaultCardElevation,
  });

  final Function onOpenerIconClicked;
  final IconData openerIcon;
  final Color openerIconColor;
  final Color openerIconSplashColor;
  final Color openerIconHighlightColor;
  final Widget child;
  final ShapeBorder shape;
  final Color cardColor;
  final double cardElevation;

  @override
  _LayeredDropdownCardState createState() => _LayeredDropdownCardState();
}

class _LayeredDropdownCardState extends State<LayeredDropdownCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      elevation: widget.cardElevation,
      clipBehavior: Clip.hardEdge,
      shape: widget.shape,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            splashColor: widget.openerIconSplashColor,
            highlightColor: widget.openerIconHighlightColor,
            onTap: widget.onOpenerIconClicked,
            child: Icon(
              widget.openerIcon,
              color: widget.openerIconColor,
            ),
          ),
          Expanded(
            child: widget.child ?? Container(),
          ),
        ],
      ),
    );
  }
}

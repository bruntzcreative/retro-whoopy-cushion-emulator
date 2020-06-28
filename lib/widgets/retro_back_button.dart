import 'package:flutter/material.dart';

class RetroButton extends StatefulWidget {
  RetroButton({
    @required this.imagePathUp,
    @required this.imagePathDown,
    @required this.onTap,
  })  : assert(imagePathDown != null),
        assert(imagePathUp != null),
        assert(onTap != null);
  final String imagePathUp;
  final String imagePathDown;
  final Function onTap;
  @override
  _RetroButtonState createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool up = true;

  buttonDown() {
    setState(() {
      up = false;
    });
  }

  buttonUp() {
    setState(() {
      up = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) {
            buttonDown();
          },
          onTapUp: (_) {
            buttonUp();
          },
          onTap: widget.onTap,
          child: Stack(
            children: <Widget>[
              up ? Image.asset(widget.imagePathUp) : Image.asset(widget.imagePathDown),
            ],
          ),
        ),
      ),
    );
  }
}

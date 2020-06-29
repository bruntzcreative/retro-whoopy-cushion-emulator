import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:whoopy_cushion/repositories/sound_repository.dart';
import 'package:whoopy_cushion/widgets/retro_back_button.dart';

class ChooseFartScreen extends StatelessWidget {
  static const routeName = '/ChooseFartScreen';
  const ChooseFartScreen({
    Key key,
    @required this.soundRepository,
  })  : assert(soundRepository != null),
        super(key: key);
  final SoundRepository soundRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffe00fe),
      body: Stack(
        children: <Widget>[
          AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 68),
              itemCount: Fart.values.length,
              itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _FartButton(
                      text: EnumToString.parseCamelCase(Fart.values[index]),
                      onTap: () {
                        // soundRepository.playChoice(Fart.values[index]);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: RetroButton(
              onTap: () {
                Navigator.pop(context);
              },
              imagePathDown: 'assets/buttons/back-green-down.png',
              imagePathUp: 'assets/buttons/back-green-up.png',
            ),
          )
        ],
      ),
    );
  }
}

class _FartButton extends StatefulWidget {
  const _FartButton({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function onTap;

  @override
  __FartButtonState createState() => __FartButtonState();
}

class __FartButtonState extends State<_FartButton> {
  bool up = true;

  buttonDown() {
    setState(() {
      up = !up;
    });
  }

  buttonUp() {
    setState(() {
      up = !up;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) {
          buttonDown();
        },
        onTapUp: (_) {
          buttonUp();
        },
        onTap: () {
          widget.onTap();
        },
        child: Stack(
          children: <Widget>[
            up
                ? Image.asset('assets/buttons/large-green-up.png')
                : Image.asset('assets/buttons/large-green-down.png'),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.text,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    if (up)
                      SizedBox(
                        height: 8,
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

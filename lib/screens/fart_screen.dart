import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:pimp_my_button/pimp_my_button.dart';

import 'package:whoopy_cushion/repositories/sound_repository.dart';
import 'package:whoopy_cushion/screens/about_screen.dart';
import 'package:whoopy_cushion/screens/choose_fart_screen.dart';
import 'package:whoopy_cushion/widgets/retro_back_button.dart';

class FartScreen extends StatelessWidget {
  static const routeName = '/';
  FartScreen({Key key, @required this.soundRepository}) : super(key: key);
  final SoundRepository soundRepository;
  final FlareControls _controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffe00fe),
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RetroButton(
                onTap: () {
                  Navigator.of(context).pushNamed(AboutScreen.routeName);
                },
                imagePathDown: 'assets/buttons/info-green-down.png',
                imagePathUp: 'assets/buttons/info-green-up.png',
              ),
              SizedBox(width: 12),
            ],
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.width * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            child: PimpedButton(
                duration: Duration(seconds: 1),
                particle: DemoParticle(),
                pimpedWidgetBuilder: (context, controller) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      controller.forward(from: 0.0);
                      soundRepository.playRandom();
                      _controls.play('fart');
                    },
                    child: FlareActor(
                      "assets/whoopy.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "fart",
                      controller: _controls,
                    ),
                  );
                }),
          )),
          _SmallButton(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.chevron_left,
                size: 50,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ChooseFartScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

// class _OpenContainerWrapper extends StatelessWidget {
//   const _OpenContainerWrapper({
//     this.openBuilder,
//     this.closedBuilder,
//     Key key,
//   }) : super(key: key);
//   final Function openBuilder;
//   final Function closedBuilder;
//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//         transitionDuration: Duration(milliseconds: 230),
//         // closedShape: CircleBorder(),
//         closedElevation: 0,
//         openElevation: 0,
//         closedColor: Colors.transparent,
//         // openColor: Theme.of(context).colorScheme.inActive,
//         closedBuilder: closedBuilder,
//         openBuilder: openBuilder);
//   }
// }

class _SmallButton extends StatefulWidget {
  const _SmallButton({
    Key key,
    this.text,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final String text;
  final Function onTap;
  final Widget icon;

  @override
  __SmallButtonState createState() => __SmallButtonState();
}

class __SmallButtonState extends State<_SmallButton> {
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
          onTap: () {
            widget.onTap();
          },
          child: Stack(
            children: <Widget>[
              up
                  ? Image.asset('assets/buttons/small-green-up.png')
                  : Image.asset('assets/buttons/small-green-down.png'),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      widget.icon,
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
      ),
    );
  }
}

class DemoParticle extends Particle {
  @override
  void paint(Canvas canvas, Size size, progress, seed) {
    Random random = Random(seed);
    int randomMirrorOffset = random.nextInt(8) + 1;
    CompositeParticle(children: [
      Firework(),
      CircleMirror(
          numberOfParticles: 6,
          child: AnimatedPositionedParticle(
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 110.0),
            child: FadingRect(width: 5.0, height: 15.0, color: Color(0xff00fc18)),
          ),
          initialRotation: -pi / randomMirrorOffset),
      CircleMirror.builder(
          numberOfParticles: 6,
          particleBuilder: (index) {
            return IntervalParticle(
                child: AnimatedPositionedParticle(
                  begin: Offset(0.0, 60.0),
                  end: Offset(0.0, 120.0),
                  child: FadingTriangle(
                      baseSize: 6.0 + random.nextDouble() * 4.0,
                      heightToBaseFactor: 1.0 + random.nextDouble(),
                      variation: random.nextDouble(),
                      color: Color(0xffdefe47)),
                ),
                interval: Interval(
                  0.0,
                  0.8,
                ));
          },
          // division by 0 is not good ;)
          initialRotation: -pi / randomMirrorOffset + 8),
    ]).paint(canvas, size, progress, seed);
  }
}

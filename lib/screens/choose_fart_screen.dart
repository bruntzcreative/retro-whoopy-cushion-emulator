import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import 'package:whoopy_cushion/repositories/sound_repository.dart';

class ChooseFartScreen extends StatelessWidget {
  static const routeName = '/ChooseFartScreen';
  const ChooseFartScreen({
    Key key,
    @required this.soundRepository,
    // @required this.globalRepository,
  })  : assert(soundRepository != null),
        // assert(globalRepository != null),
        super(key: key);
  final SoundRepository soundRepository;
  // final GlobalRepository globalRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[400],
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: Fart.values
                  .map(
                    (e) => _FartButton(
                      text: EnumToString.parseCamelCase(e),
                      onTap: () {
                        soundRepository.playChoice(e);
                      },
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class _FartButton extends StatelessWidget {
  const _FartButton({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: onTap,
        padding: EdgeInsets.all(0.0),
        child: Stack(
          children: <Widget>[
            Image.asset('assets/buttons/button.png'),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

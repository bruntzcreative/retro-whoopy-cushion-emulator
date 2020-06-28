import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:whoopy_cushion/repositories/sound_repository.dart';
import 'package:whoopy_cushion/screens/about_screen.dart';
import 'package:whoopy_cushion/screens/choose_fart_screen.dart';

class FartScreen extends StatelessWidget {
  static const routeName = '/';
  const FartScreen({Key key, @required this.soundRepository}) : super(key: key);
  final SoundRepository soundRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _OpenContainerWrapper(openBuilder: (BuildContext context, VoidCallback _) {
                  return AboutScreen();
                }, closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(icon: Icon(Icons.info_outline), onPressed: openContainer));
                })
              ],
            ),
            Expanded(
                child: Container(
              child: RaisedButton(
                onPressed: () async {
                  soundRepository.playRandom();
                },
                child: Text('play'),
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _OpenContainerWrapper(openBuilder: (BuildContext context, VoidCallback _) {
                  return ChooseFartScreen(soundRepository: soundRepository);
                }, closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(icon: Icon(Icons.info_outline), onPressed: openContainer));
                })
              ],
            ),
          ],
        ));
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.openBuilder,
    this.closedBuilder,
    Key key,
  }) : super(key: key);
  final Function openBuilder;
  final Function closedBuilder;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionDuration: Duration(milliseconds: 230),
        closedShape: CircleBorder(),
        closedElevation: 0,
        openElevation: 0,
        // closedColor: Theme.of(context).colorScheme.inActive,
        // openColor: Theme.of(context).colorScheme.inActive,
        closedBuilder: closedBuilder,
        openBuilder: openBuilder);
  }
}

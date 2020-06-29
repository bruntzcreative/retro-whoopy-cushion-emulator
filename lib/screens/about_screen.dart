import 'package:flutter/material.dart';
import 'package:whoopy_cushion/repositories/sound_repository.dart';
import 'package:whoopy_cushion/screens/fart_screen.dart';
import 'package:whoopy_cushion/widgets/retro_back_button.dart';

class AboutScreen extends StatefulWidget {
  static const routeName = '/about';
  AboutScreen({
    Key key,
    @required this.soundRepository,
  }) : super(key: key);
  final SoundRepository soundRepository;

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    widget.soundRepository.playIntro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffe00fe),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 68),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                            ),
                        children: [
                          TextSpan(
                            text: 'The whoopee cushion, the ',
                          ),
                          TextSpan(
                            text: 'fart ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'gag. \n\n'),
                          TextSpan(
                              text:
                                  'One of those classic jokes which never gets old! Introducing the revamped '),
                          TextSpan(
                            text: 'retro ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'whoopee cushion emulator sporting a '),
                          TextSpan(
                            text: 'cyberpunk theme!\n\n',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'WARNING - side effects include hours of '),
                          TextSpan(
                            text: 'fun!\n\n',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      // textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                        children: [
                          TextSpan(text: 'Bring your virtual whoopee cushion to any occasion.\n'),
                          TextSpan(
                              text:
                                  '     * Off to the shops?\n     * In an elevator?\n     * Visiting the in-laws?\n\n'),
                          TextSpan(text: 'With '),
                          TextSpan(
                            text: 'The Retro CyberPunk Whoopee Cushion ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'you can turn '),
                          TextSpan(
                            text: 'boredom ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'into '),
                          TextSpan(
                            text: 'laughter.\n',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'I mean who doesn\'t find farts funny?!'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                          text:
                              'I\'d like to thank Creator FILM LEARNIN FART PACK - FILM LEARNIN - YouTube https://www.youtube.com/user lonearcherfilms WESBITE: filmlearnin.com for the great fart sounds.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: RetroButton(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacementNamed(context, FartScreen.routeName);
                }
                widget.soundRepository.stopIntro();
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

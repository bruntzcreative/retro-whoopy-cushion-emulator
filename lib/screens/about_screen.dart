import 'package:flutter/material.dart';
import 'package:whoopy_cushion/widgets/retro_back_button.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = 'AboutScreen';
  const AboutScreen({Key key}) : super(key: key);

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
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                    children: [
                      TextSpan(text: 'Relax and have a laugh!'),
                      TextSpan(
                          text:
                              'Whats more fun than a retro cyberpunked themed whoopee cushion emulator?!'),
                      TextSpan(
                          text:
                              'Suitable for any occasion the Retro Whoopee Cusion Emulator can give you hours of fun. Doing the shopping, at the doctors, visting the in-laws, with Whoopie Custion Emulator you can turn bordom into laughter.'),
                    ],
                  ),
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
                              'Id like to thank Creator FILM LEARNIN FART PACK - FILM LEARNIN - YouTube https://www.youtube.com/user lonearcherfilms WESBITE: filmlearnin.com for the great fart sounds.'),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whoopy_cushion/repositories/sound_repository.dart';
import 'package:whoopy_cushion/screens/about_screen.dart';
import 'package:whoopy_cushion/screens/choose_fart_screen.dart';
import 'package:whoopy_cushion/screens/fart_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SoundRepository soundRepository = SoundRepository()..loadSounds();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Whoopy Cushion Emulator',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF00fc00),
        textTheme: GoogleFonts.orbitronTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AboutScreen.routeName:
            return MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return AboutScreen();
              },
            );
          case ChooseFartScreen.routeName:
            return MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return ChooseFartScreen(
                  soundRepository: soundRepository,
                );
              },
            );
          case FartScreen.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return FartScreen(soundRepository: soundRepository);
              },
            );
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ),
            );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whoopy_cushion/blocs/simple_bloc_delegate.dart';
import 'package:whoopy_cushion/repositories/global_repository.dart';
import 'package:whoopy_cushion/repositories/sound_repository.dart';
import 'package:whoopy_cushion/screens/about_screen.dart';
import 'package:whoopy_cushion/screens/choose_fart_screen.dart';
import 'package:whoopy_cushion/screens/fart_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => GlobalRepository(mq: MediaQuery.of(context)),
            ),
            RepositoryProvider(
              create: (context) => SoundRepository()..loadSounds(),
            ),
          ],
          child: child,
        );
      },
      title: 'Retro Whoopy Cushion Emulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AboutScreen.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return AboutScreen();
              },
            );
          case ChooseFartScreen.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return ChooseFartScreen(
                  soundRepository: RepositoryProvider.of<SoundRepository>(context),
                );
              },
            );
          case FartScreen.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return FartScreen(soundRepository: RepositoryProvider.of<SoundRepository>(context));
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

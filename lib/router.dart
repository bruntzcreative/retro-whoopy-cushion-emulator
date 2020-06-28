// import 'package:flutter/material.dart';
// import 'package:whoopy_cushion/screens/about_screen.dart';
// import 'package:whoopy_cushion/screens/choose_fart_screen.dart';
// import 'package:whoopy_cushion/screens/fart_screen.dart';

// class Router {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AboutScreen.routeName:
//         return MaterialPageRoute(
//           builder: (context) {
//             return AboutScreen();
//           },
//         );
//       case ChooseFartScreen.routeName:
//         return MaterialPageRoute(
//           builder: (context) {
//             return ChooseFartScreen();
//           },
//         );
//       case FartScreen.routeName:
//         return MaterialPageRoute(
//           builder: (context) {
//             return FartScreen();
//           },
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No route defined for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }

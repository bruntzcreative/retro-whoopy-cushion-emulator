import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = 'AboutScreen';
    const AboutScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
       body: SizedBox.expand(
         child: Center(
           child: Text('aobut'),
         ),
       ),
     );
   }
 }
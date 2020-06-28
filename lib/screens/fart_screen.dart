import 'package:flutter/material.dart';

import 'package:whoopy_cushion/repositories/sound_repository.dart';

class FartScreen extends StatefulWidget {
  static const routeName = '/';
  const FartScreen({Key key, @required this.soundRepository}) : super(key: key);
  final SoundRepository soundRepository;
  @override
  _FartScreenState createState() => _FartScreenState();
}

class _FartScreenState extends State<FartScreen> {
  int streamId;

  @override
  void initState() {
    super.initState();
  }

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.info_outline), onPressed: () {}),
                )
              ],
            ),
            Expanded(
                child: Container(
              color: Colors.blue,
              child: RaisedButton(
                onPressed: () async {
                  if (streamId != null) {
                    widget.soundRepository.pool.stop(streamId);
                  }
                  streamId = await widget.soundRepository.pool
                      .play(widget.soundRepository.farts[26].soundId);
                },
                child: Text('play'),
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.info_outline), onPressed: () {}),
                )
              ],
            ),
          ],
        )

        // SizedBox.expand(
        //   child: Center(
        //     child: RaisedButton(
        //         onPressed: () async {
        //           if (streamId != null) {
        //             _soundRepository.pool.stop(streamId);
        //           }
        //           streamId = await _soundRepository.pool.play(_soundRepository.farts[26].soundId);
        //         },
        //         child: Text('play')),
        //   ),
        // ),
        );
  }
}

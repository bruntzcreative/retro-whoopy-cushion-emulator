//just a place for me to dump some global sizing to
//Its a singleton so i can just grab it when ever i like.
//not the best way but im in a hurry! o.0

import 'package:flutter/material.dart';

class GlobalRepository {
  MediaQueryData mq;

  static final GlobalRepository _instance = GlobalRepository._internal();
  factory GlobalRepository({@required mq}) {
    assert(mq != null);
    _instance.mq = mq;
    return _instance;
  }
  GlobalRepository._internal();
  // Orientation get orientation => mq.orientation;
  double get width => mq.size.width;
  double get height => mq.size.height;
  EdgeInsets get padding => mq.padding;
}

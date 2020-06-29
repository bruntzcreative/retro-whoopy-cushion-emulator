import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:soundpool/soundpool.dart';

class SoundRepository {
  Soundpool _pool = Soundpool(streamType: StreamType.notification);
  List<FartRef> _farts = [];
  Random _random = new Random();
  Future<void> loadSounds() async {
    Fart.values.forEach((fart) async {
      // Becuase of some inconsitency in the wav files i had to re-encode the files
      // So the files have a _1 n the end of the name
      ByteData soundData = await rootBundle.load("assets/farts/${EnumToString.parse(fart)}_1.wav");
      int soundID = await _pool.load(soundData);
      _farts.add(FartRef(fart: fart, soundId: soundID));
    });
  }

  void playRandom() {
    int randomNumber = _random.nextInt(_farts.length);
    _pool.play(_farts[randomNumber].soundId);
  }

  void playChoice(Fart fart) {
    FartRef fartRef = _farts.firstWhere(
      (FartRef fartRef) => fartRef.fart == fart,
      orElse: () => null,
    );
    _pool.play(fartRef.soundId);
  }
}

class FartRef {
  FartRef({this.fart, this.soundId});
  final Fart fart;
  final int soundId;
}

enum Fart {
  Bouncy,
  CheekyMonkey,
  RowOfDucks,
  DuckStep,
  DudeWut,
  ExcuseMeMistress,
  FartyPant,
  GoodMorningJim,
  GoodMorningSally,
  HookLineAndStinker,
  KidIcarusHurt,
  MagicMushroom,
  NesTennis,
  OhYou,
  PeckOnTheCheek,
  PingPong,
  RectalFusion,
  SteakDiane,
  TheCutesyPoo,
  TheFairysKiss,
  TheFartAndTheFurious,
  TheFly,
  TheForce,
  TheFreshRaspberry,
  TheFriendZone,
  TheGentlemansSneak,
  TheGrunt,
  TheHardSwallow,
  TheJitterbug,
  TheMarioJump,
  TheMeatball,
  ThePowderedToast,
  TheSoftKiss,
  TheSpitTake,
  TheSqueaker,
  TheStrain,
  TheSupressedFire,
  TheTurtlesSecret,
  Wasp,
  WasThatWet,
  WeeLittleLaddie,
  WhyHello
}

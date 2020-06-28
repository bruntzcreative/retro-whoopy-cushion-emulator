import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundRepository {
  Soundpool pool = Soundpool(streamType: StreamType.notification);
  List<FartRef> farts = [];
  Future<void> loadSounds() async {
    Fart.values.forEach((fart) async {
      ByteData soundData = await rootBundle.load("assets/farts/${EnumToString.parse(fart)}.wav");
      int soundID = await pool.load(soundData);
      farts.add(FartRef(fart: fart, soundId: soundID));
    });
  }

  void playRandom() {}

  void playAll() {}
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

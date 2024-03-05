import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/ground.dart';

class FlappyBirdGame extends FlameGame{

@override
FutureOr<void> onLoad() {
    addAll([BackGround(),Ground()]);
  }
}
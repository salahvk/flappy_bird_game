import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/components/Bird.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/ground.dart';
import 'package:flappy_bird_game/game/pipe_group.dart';

class FlappyBirdGame extends FlameGame{
late Bird bird;
@override
FutureOr<void> onLoad() {
    addAll([BackGround(),Ground(),bird=Bird(),PipeGroup()]);
  }
}
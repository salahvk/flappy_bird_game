import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_game/components/Bird.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/ground.dart';
import 'package:flappy_bird_game/game/pipe_group.dart';
import 'package:flappy_bird_game/utils/config/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector{
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  FutureOr<void> onLoad() {
    addAll([BackGround(), Ground(), bird = Bird(), PipeGroup()]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}

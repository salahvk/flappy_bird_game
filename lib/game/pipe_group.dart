import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird_game/components/pipe.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/utils/config/configuration.dart';
import 'package:flappy_bird_game/utils/constants/enums.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();
  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    addAll([
      Pipe(pipePosition: PipePosition.top, height: 100),
      Pipe(pipePosition: PipePosition.bottom, height: 80)
    ]);
  }
  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}

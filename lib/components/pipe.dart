import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/utils/config/configuration.dart';
import 'package:flappy_bird_game/utils/constants/assets.dart';
import 'package:flappy_bird_game/utils/constants/enums.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.assetsImagesPipe);
    final rotatedPipe = await Flame.images.load(Assets.assetsImagesPipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(rotatedPipe);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
  }
}

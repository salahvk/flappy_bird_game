import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/utils/constants/assets.dart';
import 'package:flappy_bird_game/utils/constants/enums.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final birdMidFlap =
        await gameRef.loadSprite(Assets.assetsImagesBirdMidflap);
    final birdUpFlap = await gameRef.loadSprite(Assets.assetsImagesBirdUpflap);
    final birdDownFlap =
        await gameRef.loadSprite(Assets.assetsImagesBirdDownflap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y /2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap
    };
  }
}

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/utils/constants/assets.dart';

class BackGround extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.assetsImagesBackground);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}

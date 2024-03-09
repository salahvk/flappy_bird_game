import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_game/components/pipe.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/utils/config/configuration.dart';
import 'package:flappy_bird_game/utils/constants/enums.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);
    // print("______________")    ;
    // print("HeightMinusGround : $heightMinusGround");
    // print("Spacing : $spacing");
    // print("CenterY : $centerY");
    // eg: -
    // HeightMinusGround : 627.4545454545455
    // Random No : 0.1595413303933546
    // Spacing : 111.8789328225585
    // CenterY : 112.9673890233002
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacing / 2))
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if(position.x < -10){
      removeFromParent();
    }
  }
}

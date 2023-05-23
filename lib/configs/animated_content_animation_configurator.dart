// Animation configuration class to define animation settings
import 'package:animated_content/animated_content.dart';
import 'package:animated_content/configs/animation_config.dart';
import 'package:flutter/material.dart';

class AnimatedContentAnimationConfigurator {
  static AnimationConfig getAnimationConfig(AnimatedContentAnimation animation) {
    switch (animation) {
      case AnimatedContentAnimation.slideLeftToRight:
      case AnimatedContentAnimation.fadeSlideLeftToRight:
        return AnimationConfig(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
          curve: Curves.easeInOut,
        );
      case AnimatedContentAnimation.slideRightToLeft:
      case AnimatedContentAnimation.fadeSlideRightToLeft:
        return AnimationConfig(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
          curve: Curves.easeInOut,
        );
      case AnimatedContentAnimation.slideUpToDown:
      case AnimatedContentAnimation.fadeUpToDown:
        return AnimationConfig(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
          curve: Curves.easeInOut,
        );
      case AnimatedContentAnimation.slideDownToUp:
      case AnimatedContentAnimation.fadeDownToUp:
        return AnimationConfig(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
          curve: Curves.easeInOut,
        );
    }
  }
}
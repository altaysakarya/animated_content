library animated_content;
import 'package:animated_content/configs/animated_content_animation_configurator.dart';
import 'package:flutter/material.dart';

enum AnimatedContentAnimation {
  slideLeftToRight,
  slideRightToLeft,
  slideUpToDown,
  slideDownToUp,
  fadeSlideLeftToRight,
  fadeSlideRightToLeft,
  fadeUpToDown,
  fadeDownToUp,
}

class AnimatedContent extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimatedContentAnimation animation;

  const AnimatedContent({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.animation = AnimatedContentAnimation.slideLeftToRight,
  }) : super(key: key);

  @override
  _AnimatedContentState createState() => _AnimatedContentState();
}

class _AnimatedContentState extends State<AnimatedContent> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Curve _curve;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Configure the animation based on the selected animation type
    _configureAnimation();

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animation != oldWidget.animation) {
      _configureAnimation();
      _animationController.forward(from: 0.0);
    }
  }

  void _configureAnimation() {
    // Use a separate configuration class to define animation settings
    final animationConfig = AnimatedContentAnimationConfigurator.getAnimationConfig(widget.animation);

    _animation = Tween<Offset>(
      begin: animationConfig.begin,
      end: animationConfig.end,
    ).animate(_animationController);
    _curve = animationConfig.curve;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: _animation,
          child: _shouldApplyFadeTransition()
              ? FadeTransition(
                  opacity: _animationController.drive(CurveTween(curve: _curve)),
                  child: widget.child,
                )
              : widget.child,
        );
      },
    );
  }

  bool _shouldApplyFadeTransition() {
    final animationType = widget.animation.toString().split(".").last.substring(0, 4).toLowerCase();
    return animationType == "fade";
  }
}




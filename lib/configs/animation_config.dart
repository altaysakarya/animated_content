// Animation configuration data class
import 'package:flutter/material.dart';

class AnimationConfig {
  final Offset begin;
  final Offset end;
  final Curve curve;

  AnimationConfig({
    required this.begin,
    required this.end,
    required this.curve,
  });
}

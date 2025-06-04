import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AnimateWrapper extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final bool infinite;
  final bool manualTrigger;
  final bool animate;
  final Curve curve;
  final AnimationType _type;

  const AnimateWrapper({
    super.key,
    required this.child,
    required AnimationType type,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.infinite = false,
    this.manualTrigger = false,
    this.animate = true,
    this.curve = Curves.easeOut,
  }) : _type = type;

  factory AnimateWrapper.fadeIn({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool infinite = false,
    bool manualTrigger = false,
    bool animate = true,
    Curve curve = Curves.easeOut,
  }) {
    return AnimateWrapper(
      type: AnimationType.fadeIn,
      duration: duration,
      delay: delay,
      infinite: infinite,
      manualTrigger: manualTrigger,
      animate: animate,
      curve: curve,
      child: child,
    );
  }

  factory AnimateWrapper.zoomIn({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool infinite = false,
    bool manualTrigger = false,
    bool animate = true,
    Curve curve = Curves.easeOut,
  }) {
    return AnimateWrapper(
      type: AnimationType.zoomIn,
      duration: duration,
      delay: delay,
      infinite: infinite,
      manualTrigger: manualTrigger,
      animate: animate,
      curve: curve,
      child: child,
    );
  }

  factory AnimateWrapper.bounce({
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = Duration.zero,
    bool infinite = false,
    bool manualTrigger = false,
    bool animate = true,
    Curve curve = Curves.easeOutBack,
  }) {
    return AnimateWrapper(
      type: AnimationType.bounce,
      duration: duration,
      delay: delay,
      infinite: infinite,
      manualTrigger: manualTrigger,
      animate: animate,
      curve: curve,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case AnimationType.fadeIn:
        return FadeIn(
          duration: duration,
          delay: delay,
          manualTrigger: manualTrigger,
          animate: animate,
          curve: curve,
          child: child,
        );
      case AnimationType.zoomIn:
        return ZoomIn(
          duration: duration,
          delay: delay,
          manualTrigger: manualTrigger,
          animate: animate,
          curve: curve,
          child: child,
        );
      case AnimationType.bounce:
        return Bounce(
          duration: duration,
          delay: delay,
          infinite: infinite,
          manualTrigger: manualTrigger,
          animate: animate,
          curve: curve,
          child: child,
        );
    }
  }
}

enum AnimationType { fadeIn, zoomIn, bounce }

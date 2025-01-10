//---- Create Custom page routes ----//
import 'package:flutter/material.dart';

class DelayedCurve extends Curve {
  const DelayedCurve() : super();

  @override
  double transformInternal(double t) {
    if (t < 0.5) {
      return 0.0;
    } else {
      return (t - 0.5) * 2.0;
    }
  }
}

class CurveDelayed extends Curve {
  const CurveDelayed() : super();

  @override
  double transformInternal(double t) {
    if (t > 0.5) {
      return 1.0;
    } else {
      return t * 2;
    }
  }
}

//-- Custom page route to apply fade transition --//
Route createRouteWithFade({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 2500),
    reverseTransitionDuration: Duration(milliseconds: 2500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation.drive(Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: const DelayedCurve()))),
        child: FadeTransition(
          opacity: secondaryAnimation.drive(Tween<double>(begin: 1, end: 0)
              .chain(CurveTween(curve: const CurveDelayed()))),
          child: child,
        ),
      );
    },
  );
}

//-- Custom page route to apply slide transition --//
Route createRouteWithSlide({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 2500),
    reverseTransitionDuration: Duration(milliseconds: 2500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ),
        child: child,
      );
    },
  );
}

//-- Custom page route to apply slide right transition --//
class SlideRightRoute extends PageRouteBuilder {
  final Widget child;

  SlideRightRoute({required this.child})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) => child,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

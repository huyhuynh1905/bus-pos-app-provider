import 'package:flutter/material.dart';


class MaterialPageRoutePlus<T> extends MaterialPageRoute<T> {
  MaterialPageRoutePlus({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;

    var tween = Tween(begin: begin, end: end);
    var offsetAnimation = animation.drive(tween);

    // You can adjust the curve and scale values for a different effect.
    var curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut, // Optional: Use the same curve for reverse
    );

    var scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation);

    return ScaleTransition(
      scale: scaleAnimation,
      child: SlideTransition(
        position: offsetAnimation,
        child: child,
      ),
    );
  }
}

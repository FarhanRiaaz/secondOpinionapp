import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RoundedRectangularWidget extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  final double borderWidth;
  final List<double>? dashPattern;

  const RoundedRectangularWidget({
    Key? key,
    required this.child,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.dashPattern,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(borderRadius),
      dashPattern: dashPattern!,
      strokeWidth: borderWidth,
      color: Theme.of(context).primaryColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

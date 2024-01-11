import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final bool isAddMore = false;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 50.0,
    this.gradient,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: backgroundColor == Colors.white
            ? Border.all(color: ColorConstant.deepPurpleA200)
            : null,
        gradient: LinearGradient(
            begin: const Alignment(-0.195, 1),
            end: const Alignment(-0.195, -1),
            colors: [
              ColorConstant.indigo500,
              ColorConstant.purpleA100,
            ],
            transform: const GradientRotation(0.4)),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}

class MyElevatedButtonDisableColor extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final bool isOtpEmpty;

  const MyElevatedButtonDisableColor({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 50.0,
    this.gradient,
    this.backgroundColor,
    required this.isOtpEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: const Alignment(-0.195, 1),
            end: const Alignment(-0.195, -1),
            colors: [
              ColorConstant.indigo500,
              ColorConstant.purpleA100,
            ],
            transform: const GradientRotation(0.15)),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: isOtpEmpty ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          disabledBackgroundColor: Colors.white70,
          disabledForegroundColor: Colors.white70,
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:python_basics/core/constants/color_constants.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/26/2024, Wednesday

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;

  const CustomContainer({
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? ColorConstant.secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(-5, 5), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textData;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? buttonColor;
  final VoidCallback? onTapCallBack;
  final Widget? child;

  const CustomButton({
    Key? key,
    this.textStyle,
    this.width,
    this.height,
    required this.textData,
    this.borderRadius,
    this.buttonColor,
    this.child,
    @required this.onTapCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTapCallBack,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 100.0),
          color: buttonColor ?? Colors.purple[400],
          boxShadow: buttonColor != Colors.black.withOpacity(0.5)
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(4, 4),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        height: height ?? 50,
        width: width,
        child: Padding(
          padding:
              EdgeInsets.only(left: screenWidth / 30, right: screenWidth / 30),
          child: Stack(
            children: [
              Center(
                child: child ??
                    Text(
                      textData,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

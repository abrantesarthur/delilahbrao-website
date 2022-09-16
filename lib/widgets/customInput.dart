// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final VoidCallback? onTapCallback;
  final String? hintText;
  final Color? hintColor;
  final Color? iconDataColor;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final bool? enabled;
  final double? fontSize;
  final int? maxLines;
  final String? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? fontColor;
  final bool? hasBorders;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;

  const CustomInput({
    Key? key,
    this.maxLines,
    this.enabled,
    this.hintText,
    this.hintColor,
    this.iconDataColor,
    this.onTapCallback,
    this.inputFormatters,
    this.controller,
    this.width,
    this.keyboardType,
    this.obscureText,
    this.autoFocus,
    this.focusNode,
    this.fontSize,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.fontColor,
    this.hasBorders = false,
    this.crossAxisAlignment,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title ?? "",
                style: titleStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
              )
            : Container(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: hasBorders == false
                ? null
                : Border.all(color: Colors.black, width: 0.5),
            color: backgroundColor ?? Colors.white,
          ),
          height: height ?? 50,
          width: width,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  textAlign: crossAxisAlignment != null &&
                          crossAxisAlignment == CrossAxisAlignment.end
                      ? TextAlign.end
                      : TextAlign.start,
                  onTap: onTapCallback,
                  maxLines: maxLines,
                  enabled: enabled,
                  autofocus: autoFocus ?? false,
                  focusNode: focusNode,
                  inputFormatters: inputFormatters,
                  controller: controller,
                  keyboardType: keyboardType,
                  style: TextStyle(
                    fontSize: fontSize ?? 18,
                    color: fontColor,
                  ),
                  obscureText: obscureText ?? false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: fontSize ?? 18,
                      color: hintColor ??
                          (onTapCallback != null
                              ? Colors.purple[400]
                              : Colors.black.withOpacity(0.5)),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

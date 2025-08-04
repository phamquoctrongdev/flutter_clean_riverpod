import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_riverpod/presentation/common/build_context_ext.dart';

import '../../theme/app_theme_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.isPassword,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.textInputAction,
    this.textAlign,
    this.textStyle,
    this.inputFormatters,
    this.onChanged,
    this.onSuffixIconPressed,
    this.validator,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool? isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onSuffixIconPressed;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.getColor(AppPalette.mainColor),
      cursorErrorColor: context.getColor(AppPalette.mainColor),
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      obscuringCharacter: "●",
      style: textStyle ??
          TextStyle(
              fontSize: 16 / (MediaQuery.of(context).textScaler.scale(1.0)),
              fontWeight: FontWeight.w600),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      textAlign: textAlign ?? TextAlign.start,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: context.getColor(AppPalette.primaryTextColor),
        suffixIcon: suffixIcon != null
            ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: suffixIcon!,
                onPressed: onSuffixIconPressed,
              )
            : null,
        suffixIconColor: context.getColor(AppPalette.primaryTextColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: context.getColor(AppPalette.primaryTextFieldBackground),
        errorStyle: TextStyle(
          color: Colors.red.shade500,
        ),
      ),
      validator: validator,
    );
  }
}

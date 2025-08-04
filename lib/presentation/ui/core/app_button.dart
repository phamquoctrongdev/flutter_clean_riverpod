import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/ui/core/app_text.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.onTap,
    this.width,
    this.height,
    this.padding,
    this.border,
  });

  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderSide? border;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
              side: border ?? BorderSide.none,
            ),
            foregroundColor: titleColor,
            backgroundColor: backgroundColor,
            splashFactory: NoSplash.splashFactory,
            minimumSize: Size.zero,
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
          ),
          child: AppText(
            text: title,
            maxLines: 1,
          ),
        ),
      );
}

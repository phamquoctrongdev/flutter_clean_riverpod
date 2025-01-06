import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/common/app_extension.dart';

import '../../theme/theme_color.dart';

class LoadingMask extends StatefulWidget {
  const LoadingMask({super.key, required this.child});

  final Widget child;

  static LoadingMaskState of(BuildContext context) {
    return context.findAncestorStateOfType<LoadingMaskState>()!;
  }

  @override
  State<LoadingMask> createState() => LoadingMaskState();
}

class LoadingMaskState extends State<LoadingMask> {
  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void close() {
    if (!hasLoadingMask) {
      return;
    }
    setState(() {
      _isLoading = false;
    });
  }

  bool get hasLoadingMask => _isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isLoading)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isLoading)
          Center(
            child: CircularProgressIndicator(
              color: context.color(AppColor.mainColor),
            ),
          ),
      ],
    );
  }
}

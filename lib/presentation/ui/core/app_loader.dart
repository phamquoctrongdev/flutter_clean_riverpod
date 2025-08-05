import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/common/build_context_ext.dart';
import 'package:flutter_clean_riverpod/presentation/theme/app_theme_extension.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key, required this.child});

  final Widget child;

  static AppLoaderState of(BuildContext context) {
    return context.findAncestorStateOfType<AppLoaderState>()!;
  }

  @override
  State<AppLoader> createState() => AppLoaderState();
}

class AppLoaderState extends State<AppLoader> {
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
          SpinKitSpinningLines(
            color: context.getColor(AppPalette.secondaryColor),
          ),
      ],
    );
  }
}

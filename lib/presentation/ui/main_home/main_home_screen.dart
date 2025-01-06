import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_enum.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: AppBottomNavigationTab.values
            .map(
              (tab) => BottomNavigationBarItem(
                label: tab.title,
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: tab.icon,
                ),
              ),
            )
            .toList(),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        onTap: (int index) {
          navigationShell.goBranch(index);
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/common/app_extension.dart';
import 'package:flutter_clean_riverpod/presentation/ui/home/home_controller.dart';
import 'package:flutter_clean_riverpod/presentation/ui/home/widget/country_item_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(
      () => context.openLoadingMask(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    ref.listen(
      homeControllerProvider,
      (previous, next) {
        if (next.isLoading) {
          context.openLoadingMask();
        } else {
          context.closeLoadingMask();
        }
      },
    );
    return Scaffold(
      body: state.hasValue
          ? ListView.separated(
              itemBuilder: (context, index) => CountryItemView(
                country: state.requireValue.countries[index],
              ),
              itemCount: state.requireValue.countries.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 32.0,
              ),
            )
          : null,
    );
  }
}

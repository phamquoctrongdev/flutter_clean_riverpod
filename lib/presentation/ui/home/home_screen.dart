import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/common/build_context_ext.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.displayLoader();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    ref.listen(homeControllerProvider, (previous, next) {
      if (next.isLoading) {
        context.displayLoader();
      } else {
        context.closeLoader();
      }
      if (next.hasError) {
        context.showError(next.error);
      }
    });
    return Scaffold(
      body: state.hasValue
          ? ListView.separated(
              itemBuilder: (context, index) =>
                  CountryItemView(data: state.requireValue.countries[index]),
              itemCount: state.requireValue.countries.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 32.0),
            )
          : null,
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/data/response/country/country_response.dart';
import 'package:flutter_clean_riverpod/generated/locale_keys.g.dart';
import 'package:flutter_clean_riverpod/presentation/common/build_context_ext.dart';
import 'package:flutter_clean_riverpod/presentation/theme/app_theme_extension.dart';
import 'package:flutter_clean_riverpod/presentation/ui/core/app_text.dart';

class CountryItemView extends StatelessWidget {
  const CountryItemView({
    super.key,
    required this.data,
  });

  final CountryResponse data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.getColor(AppPalette.secondaryBackground),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 8.0,
          children: [
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                  imageUrl: data.flags.png,
                  fit: BoxFit.cover,
                  // width: 128.0,
                  // height: 96.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: '${data.name.official} (${data.name.common})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText(
                    text:
                        '${LocaleKeys.capital.tr()} ${data.capital.join(',')}',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

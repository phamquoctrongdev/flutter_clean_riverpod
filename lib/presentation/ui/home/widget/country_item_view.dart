import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/data/response/country/country_response.dart';

class CountryItemView extends StatelessWidget {
  const CountryItemView({
    super.key,
    required this.country,
  });

  final CountryResponse country;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: country.flags.png,
      fit: BoxFit.contain,
    );
  }
}

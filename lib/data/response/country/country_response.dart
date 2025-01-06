import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'flag_country_response.dart';
import 'name_country_response.dart';

part 'country_response.freezed.dart';
part 'country_response.g.dart';

@freezed
class CountryResponse with _$CountryResponse {
  const factory CountryResponse({
    required NameCountryResponse name,
    @Default([]) List<String> capital,
    required String region,
    String? subregion,
    required double area,
    required int population,
    required FlagCountryResponse flags,
  }) = _CountryResponse;

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);
}

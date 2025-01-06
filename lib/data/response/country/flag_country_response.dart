import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flag_country_response.freezed.dart';
part 'flag_country_response.g.dart';

@freezed
class FlagCountryResponse with _$FlagCountryResponse {
  const factory FlagCountryResponse({
    required String png,
    required String svg,
  }) = _FlagCountryResponse;
  
  

  factory FlagCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$FlagCountryResponseFromJson(json);
}
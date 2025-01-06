import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_country_response.freezed.dart';
part 'name_country_response.g.dart';

@freezed
class NameCountryResponse with _$NameCountryResponse {
  const factory NameCountryResponse({
    required String common,
    required String official,
  }) = _NameCountryResponse;

  factory NameCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$NameCountryResponseFromJson(json);
}

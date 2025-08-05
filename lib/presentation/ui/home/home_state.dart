import 'package:flutter/foundation.dart';
import 'package:flutter_clean_riverpod/data/response/country/country_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<CountryResponse> countries,
  }) = _HomeState;
}

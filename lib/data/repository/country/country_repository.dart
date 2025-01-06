import 'package:flutter_clean_riverpod/data/core/api_result.dart';
import 'package:flutter_clean_riverpod/data/response/country/country_response.dart';

abstract class CountryRepository {
  Future<ApiResult<List<CountryResponse>>> fetchAllCountries();
}

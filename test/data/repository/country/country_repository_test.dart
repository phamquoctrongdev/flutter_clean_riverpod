import 'package:dio/dio.dart';
import 'package:flutter_clean_riverpod/data/core/api_client.dart';
import 'package:flutter_clean_riverpod/data/core/api_result.dart';
import 'package:flutter_clean_riverpod/data/error/api_error.dart';
import 'package:flutter_clean_riverpod/data/repository/country/country_repository.dart';
import 'package:flutter_clean_riverpod/data/response/country/country_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Dio>(),
  MockSpec<ApiClient>(),
  MockSpec<DioException>(),
  MockSpec<CountryResponse>(),
  MockSpec<CountryRepository>(),
])
void main() {
  late final MockCountryRepository repository;
  setUpAll(() {
    repository = MockCountryRepository();
  });
  test('Fetch data success is successfully.', () async {
    final mockResponseSuccess = ApiResult<List<CountryResponse>>.success([
      MockCountryResponse(),
      MockCountryResponse(),
    ]);
    provideDummy(mockResponseSuccess);
    when(
      repository.fetchAllCountries(),
    ).thenAnswer((_) async => mockResponseSuccess);
    final actual = await repository.fetchAllCountries();
    expect(actual, isA<ApiResult<List<CountryResponse>>>());
    expect(
      actual,
      isA<Success<List<CountryResponse>>>()
          .having(
            (value) => value.value,
            'Is a list of CountryResponse',
            isA<List<CountryResponse>>(),
          )
          .having(
            (value) => value.value.length,
            'Value has 2 items',
            equals(2),
          ),
    );
  });
  test('Fetch data is error.', () async {
    final mockError = ApiResult<List<CountryResponse>>.failed(InternetError());
    provideDummy(mockError);
    when(repository.fetchAllCountries()).thenAnswer((_) async => mockError);
    final actual = await repository.fetchAllCountries();
    expect(actual, isA<Failure>());
  });
}

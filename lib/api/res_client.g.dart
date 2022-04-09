// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org/3/discover';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ListResponse<List<ResultsModel>>>> getListMovie(
      {key, page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': key, r'page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ListResponse<List<ResultsModel>>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/movie',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListResponse<List<ResultsModel>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<ResultsModel>(
                (i) => ResultsModel.fromJson(i as Map<String, dynamic>))
            .toList());
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

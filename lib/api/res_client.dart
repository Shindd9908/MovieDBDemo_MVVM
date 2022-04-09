import 'dart:io';
import 'package:dio/dio.dart';
import 'package:newdemo/api/response_model/list_response.dart';
import 'package:newdemo/model/results_model.dart';
import 'package:retrofit/retrofit.dart';

import '../app_config.dart';
part 'res_client.g.dart';
const int pageSize = 1;

@RestApi(baseUrl: AppConfig.prefixUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  //==================== Get Api ====================//

@GET('/movie')
Future<HttpResponse<ListResponse<List<ResultsModel>>>> getListMovie({
  @Query('api_key') String? key,
  @Query('page') int? page,
});

}
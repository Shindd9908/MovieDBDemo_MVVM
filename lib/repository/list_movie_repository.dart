import 'package:newdemo/app_config.dart';
import 'package:newdemo/model/results_model.dart';
import 'package:newdemo/repository/repository.dart';

import '../api/api_response.dart';
import '../api/response_model/list_response.dart';

class ListMovieRepository extends Repository {
  Future<ApiResponse<ListResponse<List<ResultsModel>>>> getListMovie({required String key, required int page}) async {
    return apiClient!.getListMovie(key: key,page: page).wrap();
  }
}
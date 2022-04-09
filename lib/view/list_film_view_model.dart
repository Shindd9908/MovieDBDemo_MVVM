import 'package:newdemo/api/api_response.dart';
import 'package:newdemo/api/response_model/list_response.dart';
import 'package:newdemo/app_config.dart';
import 'package:newdemo/base/base_view_model.dart';
import 'package:newdemo/base/loadmore_mixin.dart';
import 'package:newdemo/model/results_model.dart';
import 'package:newdemo/repository/list_movie_repository.dart';

class ListFilmViewModel extends BaseViewModel with LoadMoreMixin<ResultsModel>{
  final ListMovieRepository repo;

  ListFilmViewModel(this.repo) : super(repo){
    refreshData(needShowLoading: true);
  }

  @override
  Future<ApiResponse<ListResponse<List<ResultsModel>>>> getData() {
    return repo.getListMovie(key: AppConfig.apiKey, page: pagingRequest.page!);
  }

  @override
  void notifyData() {
    notifyListeners();
  }

  @override
  set notifyLoading(bool value) {
    setLoading = value;
  }

}
import '../api/dio_helper.dart';
import '../api/res_client.dart';

class Repository {
  RestClient? apiClient;

  Repository() {
    apiClient = RestClient(DioHelper.dioObject!);
  }
}

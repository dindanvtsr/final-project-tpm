import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadNews() {
    return BaseNetwork.get("v4/articles");
  }

  Future<Map<String, dynamic>> loadDetailNews(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetwork.get("/v4/articles/$id");
  }

}
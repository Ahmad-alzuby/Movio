import 'package:dio/dio.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

class Api {
  Dio dio = Dio();

  Api() {
    dio.options = BaseOptions(baseUrl: ApiEndBoint.baseUrl);
  }
  Future<List<dynamic>> getMovies({required String endBouint}) async {
    Response respons = await dio.get(endBouint);
    return respons.data['results'];
  } Future<List<dynamic>> getGenre({required String endBouint}) async {
    Response respons = await dio.get(endBouint);
    return respons.data['genres'];
  }
  
}

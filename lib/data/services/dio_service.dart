import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:get_storage/get_storage.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> postMethod(String url, Map<String, dynamic> map) async {
    dio.options.headers['content-Type'] = 'application/json';

    var token = GetStorage().read(StorageKeys.token);
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return await dio
        .post(
      url,
      data: dio_service.FormData.fromMap(map),
      options: Options(
        responseType: ResponseType.json,
        method: 'POST',
        // followRedirects: false,
        // validateStatus: (status) {
        //   return status! < 500;
        // },
      ),
    )
        .then((response) {
      return response;
    });
  }
}

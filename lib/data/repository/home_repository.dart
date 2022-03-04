import 'package:dio/dio.dart';
import 'package:interceptors/data/endpoints/endpoints.dart';
import 'package:interceptors/data/network/dio_client.dart';
import 'package:interceptors/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptors/model/user.dart';
import 'package:interceptors/services/locator.dart';

class HomeRepository {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<List<User>> getAllUsers() async {
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.allUsers}',
      options: Options(
        headers: {
          'Authorization': '${sharedPrefLocator.getUserToken()}',
        },
      ),
    );
    final data = (response.data as List).map((e) => User.fromJson(e)).toList();
    return data;
  }
}

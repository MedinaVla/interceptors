import 'package:dio/dio.dart';
import 'package:interceptors/data/endpoints/endpoints.dart';
import 'package:interceptors/data/network/dio_client.dart';
import 'package:interceptors/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptors/model/user.dart';
import 'package:interceptors/services/locator.dart';

class ProfileRepository {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<User> getUserProfileDetails() async {
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.profile}',
      options: Options(
        headers: {
          'Authorization': '${sharedPrefLocator.getUserToken()}',
        },
      ),
    );
    return User.fromJson(response.data['user']);
  }
}

import 'package:catelog_web/src/core/domain/common/all.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppAuthState {
  AppAuthState._();

  static AppAuthState? _instance;

  static AppAuthState get instance => _instance ??= AppAuthState._();

  String? loginUserID;

  Future<void> initialise() async {
    await _loadAuthState();
  }

  Future<void> _loadAuthState() async {
    var userID = await const FlutterSecureStorage().read(key: 'loginUserID');
    if (userID != null) {
      loginUserID = userID;
    }
  }

  Future<void> setAuthUser({
    required String userID,
  }) async {
    loginUserID = userID;
    await _storeUser(userID);
  }

  Future<void> logout() async {
    await const FlutterSecureStorage().delete(key: 'loginUserID');
    loginUserID = null;
  }

  _storeUser(String userID) async {
    await const FlutterSecureStorage().write(
      key: 'loginUserID',
      value: userID,
    );
  }

  authStore({required String email, required String password}) async {
    await const FlutterSecureStorage().write(key: email, value: password);
  }

  Future<ApiResult<String>> checkAuth(
      {required String email, required String password}) async {
    ApiResult<String> result =
        const ApiResult.failure(message: 'Something went wrong');
    var userID = await const FlutterSecureStorage().read(key: email);
    if (userID != null) {
      if (userID == password) {
        result = const ApiResult.success(data: 'Success');
      } else {
        result = const ApiResult.failure(message: 'Wrong password');
      }
    }
    return result;
  }
}

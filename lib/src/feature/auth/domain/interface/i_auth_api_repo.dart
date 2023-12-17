import 'package:catelog_web/src/core/domain/common/all.dart';

import '../model/user_model.dart';

abstract class IAuthApiRepo {
  Future<ApiResult<String>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<String>> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<ApiResult<String>> resetPassword({required String email});

  Future<ApiResult<UserModel>> getUser();

  Future<void> token();

  Future<void> logout();
}

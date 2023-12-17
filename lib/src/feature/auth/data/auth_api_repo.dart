import 'package:catelog_web/src/core/domain/common/all.dart';
import 'package:catelog_web/src/feature/auth/domain/interface/i_auth_api_repo.dart';
import 'package:flutter/cupertino.dart';

import '../domain/model/user_model.dart';

class AuthApiRepo implements IAuthApiRepo {
  late dynamic _database;
  //
  // AuthApiRepo({IDb? database}) {
  //   // _database = database ?? FirebaseDb();
  // }

  //section login
  @override
  Future<ApiResult<String>> login(
      {required String email, required String password}) async {
    return await _database.login(email: email, password: password);
  }

  //section resetPassword
  @override
  Future<ApiResult<String>> resetPassword({required String email}) async {
    return await _database.resetPassword(email: email);
  }

  //section signup
  @override
  Future<ApiResult<String>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    return await _database.signUp(email: email, password: password, name: name);
  }

  //section Token
  @override
  Future token() async {
    await _database.token();
  }

  // streamUserData
  @override
  Future<ApiResult<UserModel>> getUser() async {
    debugPrint('Stream User Called::::');
    return await _database.getUser();
  }

  //logout
  @override
  Future<void> logout() async {
    await _database.logout();
  }
}

import 'dart:developer';

import 'package:catelog_web/src/core/domain/common/all.dart';
import 'package:catelog_web/src/core/domain/common/network_exceptions.dart';
import 'package:catelog_web/src/core/domain/common/usecase_result.dart';
import 'package:catelog_web/src/feature/auth/data/auth_api_repo.dart';
import 'package:catelog_web/src/feature/auth/domain/interface/i_auth_api_repo.dart';
import 'package:catelog_web/src/feature/auth/domain/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUseCase {
  late IAuthApiRepo _authRepository;

  AuthUseCase({IAuthApiRepo? authRepository}) {
    _authRepository = authRepository ?? GetIt.instance.get<AuthApiRepo>();
  }

  // section  Login
  Future<UsecaseResult<String>?> login(
      {required String email, required String password}) async {
    ApiResult<String> apiResult =
        await _authRepository.login(email: email, password: password);
    UsecaseResult<String>? useCaseResult;
    apiResult.when(success: (String? data) async {
      useCaseResult = UsecaseResult.success(data: data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('login', true);
      await _authRepository.token();
    }, failure: (String? message) {
      log('authenticate usecase $message');
      useCaseResult = UsecaseResult.failure(error: message);
    }, networkFailure: (NetworkExceptions error) {
      log('authenticate usecase $error');
      useCaseResult = UsecaseResult.failure(
          error: NetworkExceptions.getErrorMessage(error));
    });
    return useCaseResult;
  }

  // section  signUp
  Future<UsecaseResult<String>?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    ApiResult<String> apiResult = await _authRepository.signUp(
        email: email, password: password, name: name);
    UsecaseResult<String>? useCaseResult;
    apiResult.when(success: (String? data) async {
      // _boxUsecase.storeAuthUser(Auth(accessToken: data!.accessToken));
      // APIEndpoints.authToken = data.accessToken;
      useCaseResult = UsecaseResult.success(data: data);
    }, failure: (String? message) {
      log('authenticate usecase $message');
      useCaseResult = UsecaseResult.failure(error: message);
    }, networkFailure: (NetworkExceptions error) {
      log('authenticate usecase $error');
      useCaseResult = UsecaseResult.failure(
          error: NetworkExceptions.getErrorMessage(error));
    });
    return useCaseResult;
  }

  // section  resetPassword
  Future<UsecaseResult<String>?> resetPassword({
    required String email,
  }) async {
    ApiResult<String> apiResult =
        await _authRepository.resetPassword(email: email);
    UsecaseResult<String>? useCaseResult;
    apiResult.when(success: (String? data) async {
      // _boxUsecase.storeAuthUser(Auth(accessToken: data!.accessToken));
      // APIEndpoints.authToken = data.accessToken;
      useCaseResult = UsecaseResult.success(data: data);
    }, failure: (String? message) {
      log('authenticate usecase $message');
      useCaseResult = UsecaseResult.failure(error: message);
    }, networkFailure: (NetworkExceptions error) {
      log('authenticate usecase $error');
      useCaseResult = UsecaseResult.failure(
          error: NetworkExceptions.getErrorMessage(error));
    });
    return useCaseResult;
  }

  // section  getStream User
  Future<UsecaseResult<UserModel>?> getUser() async {
    debugPrint('streamUserData()::::');
    ApiResult<UserModel> apiResult = await _authRepository.getUser();
    UsecaseResult<UserModel>? useCaseResult;
    apiResult.when(success: (UserModel? data) async {
      useCaseResult = UsecaseResult.success(data: data);
    }, failure: (String? message) {
      log('authenticate usecase $message');
      useCaseResult = UsecaseResult.failure(error: message);
    }, networkFailure: (NetworkExceptions error) {
      log('authenticate usecase $error');
      useCaseResult = UsecaseResult.failure(
          error: NetworkExceptions.getErrorMessage(error));
    });
    return useCaseResult;
  }

  // section  logout
  logout() async {
    await _authRepository.logout();
  }
}

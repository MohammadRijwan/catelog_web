import 'package:catelog_web/main.dart';
import 'package:catelog_web/src/core/domain/common/waiting_screen.dart';
import 'package:catelog_web/src/core/util/app_router.dart';
import 'package:catelog_web/src/core/util/notification.dart';
import 'package:catelog_web/src/feature/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginVmProvider = ChangeNotifierProvider.autoDispose<LoginVm>((ref) {
  return LoginVm();
});

class LoginVm extends ChangeNotifier {
  late AuthUseCase _authUseCase;

  LoginVm() {
    _authUseCase = AuthUseCase();
  }

  void onLogin(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      AppNotification().showNotification(
          context: context,
          text: 'All the fields are required.',
          isError: true);
    } else {
      WaitingScreen.show(context);
      final result = await _authUseCase.login(email: email, password: password);
      result?.when(success: (success) {
        WaitingScreen.hide(context);
        navigatorKey.currentState?.pushReplacementNamed(AppRouter.homescreen);
      }, failure: (failure) {
        WaitingScreen.hide(context);
        AppNotification().showNotification(
            text: '$failure', context: context, isError: true);
      });
    }
  }
}

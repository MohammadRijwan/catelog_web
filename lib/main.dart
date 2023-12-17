import 'package:catelog_web/src/core/dependency/dependency_injection.dart';
import 'package:catelog_web/src/core/util/app_router.dart';
import 'package:catelog_web/src/core/util/theme.dart';
import 'package:catelog_web/src/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MyApp();
          }),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Board',
      theme: lightTheme,
      // localizationsDelegates: const [
      //   FormBuilderLocalizations.delegate,
      // ],
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}

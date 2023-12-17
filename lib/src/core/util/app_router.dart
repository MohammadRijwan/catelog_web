import 'package:catelog_web/src/feature/auth/ui/login/login_screen.dart';
import 'package:catelog_web/src/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String forget = '/forget';
  static const String homescreen = '/home';
  static const String addProduct = '/addProduct';
  static const String productDetails = '/productDetails';
  static const String cart = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case forget:
      //   return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      // case registration:
      //   return MaterialPageRoute(builder: (_) => SignUpScreen());
      // case homescreen:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      // case addProduct:
      //   return MaterialPageRoute(builder: (_) => AddProduct());
      // case cart:
      //   return MaterialPageRoute(builder: (_) => CartScreen());
      // case productDetails:
      //   final args = settings.arguments as ProductDetailsScreenArgs;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductDetails(
      //       product: args.product,
      //       onAddItemToCart: args.onAddItemToCart,
      //     ),
      //   );
      default:
        return MaterialPageRoute(
            builder: (_) => RouteErrorScreen(
                  title: 'Route Not Found',
                  message: 'Error! The route ${settings.name} not found.',
                ));
    }
  }
}

class RouteErrorScreen extends StatelessWidget {
  final String title;
  final String message;

  const RouteErrorScreen(
      {super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}

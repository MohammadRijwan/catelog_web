import 'package:catelog_web/src/feature/auth/data/auth_api_repo.dart';
import 'package:get_it/get_it.dart';

void setupDependencies() {
  // GetIt.instance.registerSingleton<IDb>(FirebaseDb());
  // final database = GetIt.instance<IDb>();
  GetIt.instance.registerSingleton<AuthApiRepo>(AuthApiRepo());
  // GetIt.instance.registerSingleton<ProductLocalRepo>(
  //     ProductLocalRepo(database: database));

  // GetIt.instance.registerSingleton<CartUsecase>(CartUsecase());
}

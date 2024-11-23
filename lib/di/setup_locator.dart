import 'package:get_it/get_it.dart';
import 'package:aneukan/data/repository/network/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // 싱글톤으로 등록
  getIt.registerSingleton<ApiService>(ApiService());
}

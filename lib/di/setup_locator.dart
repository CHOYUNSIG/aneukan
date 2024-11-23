import 'package:aneukan/data/repository/local/local_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aneukan/data/repository/network/api_service.dart';
import 'package:aneukan/data/repository/local/local_database.dart';
import 'package:sqflite/sqflite.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<LocalPreferences>(
      LocalPreferences(getIt<SharedPreferences>()));

  getIt.registerSingleton<ApiService>(ApiService());

  final database = await DatabaseHelper.initDatabase();
  getIt.registerSingleton<Database>(database);
  getIt.registerSingleton<ILocalDatabase>(LocalDatabaseImpl(getIt<Database>()));
}

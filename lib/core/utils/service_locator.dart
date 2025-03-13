import 'package:bookly/Features/home/data/datasources/localdatasource/home_local_data_source_impl.dart';
import 'package:bookly/Features/home/data/datasources/remotedatasource/home_remote_data_source_impl.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}

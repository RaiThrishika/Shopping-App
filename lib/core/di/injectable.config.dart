// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/products/data/data_sources/data_source.dart' as _i5;
import '../../features/products/data/data_sources/remote_data_source.dart'
    as _i6;
import '../../features/products/data/repository/product_list_repository.dart'
    as _i8;
import '../../features/products/data/services/api_service.dart' as _i11;
import '../../features/products/domain/repositories/product_repository.dart'
    as _i7;
import '../../features/products/domain/usecase/product_list_usecase.dart'
    as _i9;
import '../../features/products/presentation/screens/home_screen/product_list_bloc/get_product_list_bloc.dart'
    as _i10;
import '../utils/base_constants.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final aPIService = _$APIService();
    gh.factory<_i3.BaseConstants>(() => _i3.BaseConstants());
    gh.singleton<_i4.Dio>(() => aPIService.dio);
    gh.factory<_i5.DataSource>(() => _i6.RemoteDataSource(gh<_i4.Dio>()));
    gh.factory<_i7.ProductListRepository>(
        () => _i8.ProductListRepositoryImpl(gh<_i5.DataSource>()));
    gh.factory<_i9.ProductListUseCase>(
        () => _i9.ProductListUseCase(gh<_i7.ProductListRepository>()));
    gh.factory<_i10.ProductListBloc>(
        () => _i10.ProductListBloc(gh<_i9.ProductListUseCase>()));
    return this;
  }
}

class _$APIService extends _i11.APIService {}

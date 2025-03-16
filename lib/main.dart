import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/core/di/injectable.dart';
import 'package:flutter_shopping_app/core/utils/app_bloc_observer.dart';
import 'package:flutter_shopping_app/features/products/data/services/api_service.dart';
import 'package:flutter_shopping_app/features/products/presentation/screens/home_screen/product_list_bloc/get_product_list_bloc.dart';
import 'package:flutter_shopping_app/features/products/presentation/screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = AppBlocObserver();
  final dio = getIt.get<Dio>();
  dio.interceptors.add(
    AwesomeDioInterceptor(
      logRequestTimeout: false,
      logRequestHeaders: true,
      logResponseHeaders: true,
    ),
  );
  addDioHeader();
  runApp(MultiBlocProvider(
        providers: [
    BlocProvider<ProductListBloc>(
    create: (context) => getIt.get<ProductListBloc>(),
  )],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}


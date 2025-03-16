import 'package:dio/dio.dart';
import 'package:flutter_shopping_app/features/products/domain/entities/product_list_response.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'data_source.dart';

@Injectable(as: DataSource)
class RemoteDataSource extends DataSource {
  @injectable
  final Dio dio;

  RemoteDataSource(this.dio);

  @override
  Future<Either<String, ProductListResponse>> getProductList() async {
    try {
      final response = await dio.get("products");

      if (response.statusCode == 200 && response.data != null) {
        return Right(ProductListResponse.fromJson(response.data));
      } else {
        return const Left("Received Error response");
      }
    } catch (e) {
      return const Left("Exception Occurred while fetching users");
    }
  }


}

import 'package:flutter_shopping_app/features/products/domain/entities/product_list_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class DataSource {
  Future<Either<String, ProductListResponse>> getProductList();
}

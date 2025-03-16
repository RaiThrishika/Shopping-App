import 'package:flutter_shopping_app/features/products/domain/entities/product_list_response.dart';
import 'package:flutter_shopping_app/features/products/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductListUseCase {
  final ProductListRepository productListRepository;

  ProductListUseCase(this.productListRepository);

  Future<Either<String, ProductListResponse>> execute() {
    return productListRepository.getProductList();
  }
}
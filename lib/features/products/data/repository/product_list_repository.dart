import 'package:flutter_shopping_app/features/products/data/data_sources/data_source.dart';
import 'package:flutter_shopping_app/features/products/domain/entities/product_list_response.dart';
import 'package:flutter_shopping_app/features/products/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProductListRepository)
class ProductListRepositoryImpl extends ProductListRepository {
  final DataSource productDataSource;

  ProductListRepositoryImpl(this.productDataSource);

  @override
  Future<Either<String, ProductListResponse>> getProductList() async {
    return await productDataSource.getProductList();
  }

}
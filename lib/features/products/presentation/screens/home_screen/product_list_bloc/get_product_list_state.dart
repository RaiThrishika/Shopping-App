part of 'get_product_list_bloc.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = _Initial;
  const factory ProductListState.loading() = _Loading;
  const factory ProductListState.failed({required String error}) = _Failed;
  const factory ProductListState.success({required ProductListResponse response}) =
  _Success;
}




part of 'get_product_list_bloc.dart';

@freezed
class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.fetch() = _Fetch;
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/features/products/domain/entities/product_list_response.dart';
import 'package:flutter_shopping_app/features/products/domain/usecase/product_list_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_product_list_event.dart';
part 'get_product_list_state.dart';
part 'get_product_list_bloc.freezed.dart';

@Injectable()
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListUseCase useCase;
  ProductListBloc(this.useCase) : super(const ProductListState.initial()) {
    on<ProductListEvent>((event, emit) async{
      await event.when(fetch: () async{
        emit(const ProductListState.loading());
        print("Get Product ListState bloc called");
        try {
          final response = await useCase.execute();
          response.fold((l) {
            print("Get Product ListState bloc called $l");
            emit(ProductListState.failed(error: l));},
                  (r) {
                print("Get Product ListState bloc called $r");
                emit(ProductListState.success(response: r));
              });
        } catch (e) {
          emit(ProductListState.failed(error: "Error occurred $e"));
        }
      });
    });
  }
}





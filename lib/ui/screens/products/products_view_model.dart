import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';
import 'package:ecommerce_route/domain/useCases/productsUseCase/products_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewModel extends Cubit {
  ProductsUseCase productsUseCase;

  ProductsViewModel(this.productsUseCase) : super(BaseInitialState);

  void getProducts() async {
    emit(BaseLoadingState());
    Either<String, Products> response = await productsUseCase.execute();
    response.fold((error) {
      emit(BaseErrorState(error));
    }, (success) {
      emit(BaseSuccessState(success));
    });
  }
}

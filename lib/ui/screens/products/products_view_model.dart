import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';
import 'package:ecommerce_route/domain/useCases/productsUseCase/products_use_case.dart';
import 'package:ecommerce_route/domain/useCases/search/search_use_case.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit {
  ProductsUseCase productsUseCase;
  SearchUseCase searchUseCase;

  ProductsViewModel(this.productsUseCase, this.searchUseCase)
      : super(BaseInitialState);

  TextEditingController searchController = TextEditingController();

  void getProducts() async {
    emit(BaseLoadingState());
    Either<String, Products> response = await productsUseCase.execute();
    response.fold((error) {
      emit(BaseErrorState(error));
    }, (success) {
      emit(BaseSuccessState(success));
    });
  }

  void search(String text) async {
    emit(BaseLoadingState());
    Either<String, Products> response = await searchUseCase.execute(text);
    response.fold((error) {
      emit(BaseErrorState(error));
    }, (success) {
      emit(BaseSuccessState(success));
    });
  }
}

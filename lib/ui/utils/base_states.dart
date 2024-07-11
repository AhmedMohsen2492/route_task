import 'package:ecommerce_route/data/model/Products.dart';

class BaseInitialState {}

class BaseLoadingState {}

class BaseSuccessState {
  Products products ;
  BaseSuccessState(this.products);
}

class BaseErrorState {
  String errorMessage;

  BaseErrorState(this.errorMessage);
}
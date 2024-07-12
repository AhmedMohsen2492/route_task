import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';

abstract class ProductsRepo {
  Future<Either<String, Products>> getProducts();
}

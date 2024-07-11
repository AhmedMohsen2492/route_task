import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';
import 'package:ecommerce_route/domain/repos/products/products_repo.dart';

class ProductsUseCase {
  ProductsRepo productsRepo ;
  ProductsUseCase(this.productsRepo);

  Future<Either<String, Products>> execute(){
    return productsRepo.getProducts();
  }
}
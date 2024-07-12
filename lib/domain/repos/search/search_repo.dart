import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';

abstract class SearchRepo {
  Future<Either<String, Products>>  search(String text);
}
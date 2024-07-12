import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';
import 'package:ecommerce_route/domain/repos/products/products_repo.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  @override
  Future<Either<String, Products>> getProducts() async {
    String baseUrl = "dummyjson.com";
    String endPoint = "products";

    Uri uri = Uri.https(baseUrl, endPoint);

    Response response = await get(uri);

    Map json = jsonDecode(response.body);
    Products resultsResponse = Products.fromJson(json);

    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        resultsResponse.products?.isNotEmpty == true) {
      return Right(resultsResponse);
    } else {
      return const Left("Something went wrong please try again later");
    }
  }
}

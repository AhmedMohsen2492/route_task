import 'package:dartz/dartz.dart';
import 'package:ecommerce_route/data/model/Products.dart';
import 'package:ecommerce_route/domain/repos/search/search_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUseCase {
  SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  Future<Either<String, Products>> execute(String text) async {
    return searchRepo.search(text);
  }
}

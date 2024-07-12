// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/products/products_repo_impl.dart' as _i6;
import '../../data/repos/search/search_repo_impl.dart' as _i4;
import '../../ui/screens/products/products_view_model.dart' as _i9;
import '../repos/products/products_repo.dart' as _i5;
import '../repos/search/search_repo.dart' as _i3;
import '../useCases/productsUseCase/products_use_case.dart' as _i7;
import '../useCases/search/search_use_case.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.SearchRepo>(() => _i4.SearchRepoImpl());
    gh.factory<_i5.ProductsRepo>(() => _i6.ProductsRepoImpl());
    gh.factory<_i7.ProductsUseCase>(
        () => _i7.ProductsUseCase(gh<_i5.ProductsRepo>()));
    gh.factory<_i8.SearchUseCase>(
        () => _i8.SearchUseCase(gh<_i3.SearchRepo>()));
    gh.factory<_i9.ProductsViewModel>(() => _i9.ProductsViewModel(
          gh<_i7.ProductsUseCase>(),
          gh<_i8.SearchUseCase>(),
        ));
    return this;
  }
}

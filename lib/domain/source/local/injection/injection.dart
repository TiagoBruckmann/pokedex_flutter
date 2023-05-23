// import das telas
import 'package:pokedex/app/pages/home/cubit/home_cubit.dart';

// import dos domain
import 'package:pokedex/domain/repositories/pokemon_repo.dart';
import 'package:pokedex/domain/usecases/pokemon_usecase.dart';

// import dos data
import 'package:pokedex/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex/data/repositories/pokemon_repo_impl.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

int totalItems = 0;
String? nextPage;
String? previousPage;

@InjectableInit()
void configureDependencies() {

  // pages
  getIt.registerFactory(() => HomeCubit(getIt()));

  // domain
  getIt.registerFactory(() => PokemonUseCase(getIt()));

  // data
  getIt.registerFactory<PokemonRemoteDatasource>(() => PokemonRemoteDatasourceImpl(getIt()));
  getIt.registerFactory<PokemonRepo>(() => PokemonRepoImpl(getIt()));

  // extern
  getIt.registerFactory(() => http.Client());

}

void setPagination( Map<String, dynamic> json ) {
  totalItems = json["count"];
  nextPage = json["next"];
  previousPage = json["previous"];
}

void clearPagination() {
  totalItems = 0;
  nextPage = null;
  previousPage = null;
}
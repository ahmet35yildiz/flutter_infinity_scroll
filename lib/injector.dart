
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_infinity/features/listing_feature/domain/repository/pokemon_repository.dart';
import 'package:pokemon_infinity/features/listing_feature/presentation/bloc/pokemon_bloc.dart';

import 'features/listing_feature/domain/service/api_service.dart';

final injector = GetIt.instance;

void diSetup() {
  //dio
  injector.registerLazySingleton(Dio.new);
  //network
  injector.registerLazySingleton(ApiService.new);
  //repository
  injector.registerLazySingleton(PokemonRepository.new);  //tek bir instance oluşturur
  //bloc
  injector.registerLazySingleton(PokemonBloc.new);  //tek bir instance oluşturur


}
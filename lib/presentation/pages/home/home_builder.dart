import 'package:clean_rick_morty/data/datasources/characters/remote_characters_datasource/remote_characters_datasource.dart';
import 'package:clean_rick_morty/data/repository/characters/characters_repository.dart';
import 'package:clean_rick_morty/domain/use-cases/characters_use-cases/characters_use_cases.dart';
import 'package:clean_rick_morty/presentation/pages/home/bloc/home_bloc.dart';
import 'package:clean_rick_morty/presentation/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBuilder {
  Widget build() {
    final dataSource = RemoteCharactersDataSource();
    final repository = CharactersRepository(dataSource);
    final useCases = CharactersUseCases(repository);
    return BlocProvider(create: (context) => HomeBloc(useCases), child: const HomePage());
  }
}

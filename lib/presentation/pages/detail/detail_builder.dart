import 'package:clean_rick_morty/presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:clean_rick_morty/presentation/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/characters/remote_characters_datasource/remote_characters_datasource.dart';
import '../../../data/repository/characters/characters_repository.dart';
import '../../../domain/use-cases/characters_use-cases/characters_use_cases.dart';

class DetailBuilder {
  Widget build({required int id}) {
    final dataSource = RemoteCharactersDataSource();
    final repository = CharactersRepository(dataSource);
    final useCases = CharactersUseCases(repository);
    return BlocProvider(create: (context) => DetailBloc(useCases), child: DetailPage(id: id));
  }
}

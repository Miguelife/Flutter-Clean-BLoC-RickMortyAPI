import 'dart:async';
import 'package:clean_rick_morty/domain/entities/character.dart';
import 'package:clean_rick_morty/domain/entities/character_page.dart';
import 'package:clean_rick_morty/domain/use-cases/characters_use-cases/characters_use_cases_interface.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/bloc_status.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // * PROPERTIES
  final CharactersUseCasesInterface _useCases;

  // * INIT
  HomeBloc(this._useCases) : super(const HomeState(status: BlocStatus.initial)) {
    // * TRIGGERS
    on<HomeLoadCharactersEvent>(_loadCharacters);
  }

  // * FUNCTIONS
  FutureOr<void> _loadCharacters(HomeLoadCharactersEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      CharacterPage page = await _useCases.getCharacterPage(index: state.pageIndex + 1);
      List<Character> characters = [...state.characters, ...page.characters];
      emit(state.copyWith(
          status: BlocStatus.success, hasNextPage: page.hasNextPage, pageIndex: page.index, characters: characters));
    } catch (_) {
      emit(state.copyWith(status: BlocStatus.error));
    }
  }
}

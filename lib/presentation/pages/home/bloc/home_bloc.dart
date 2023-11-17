import 'dart:async';

import 'package:clean_rick_morty/domain/entities/character.dart';
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
  FutureOr<void> _loadCharacters(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState(status: BlocStatus.loading));
      List<Character> characters = await _useCases.getCharacters();
      emit(HomeState(status: BlocStatus.success, characters: characters));
    } catch (_) {
      emit(const HomeState(status: BlocStatus.error));
    }
  }
}

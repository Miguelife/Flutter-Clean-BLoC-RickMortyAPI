import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_rick_morty/domain/entities/character.dart';
import 'package:clean_rick_morty/domain/use-cases/characters_use-cases/characters_use_cases.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/bloc/bloc_status.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  // * PROPERTIES
  final CharactersUseCases _useCases;

  // * INIT
  DetailBloc(this._useCases) : super(const DetailState(status: BlocStatus.initial)) {
    // * TRIGGERS
    on<DetailGetCharacterEvent>(_loadCharacter);
  }

  FutureOr<void> _loadCharacter(DetailGetCharacterEvent event, Emitter<DetailState> emit) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      Character character = await _useCases.getCharacter(id: event.id);
      emit(state.copyWith(status: BlocStatus.success, character: character));
    } catch (_) {
      emit(state.copyWith(status: BlocStatus.error));
    }
  }
}

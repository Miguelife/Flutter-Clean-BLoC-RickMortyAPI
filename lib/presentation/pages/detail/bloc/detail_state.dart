part of 'detail_bloc.dart';

class DetailState extends Equatable {
  // * PROPERTIES
  final BlocStatus status;
  final Character? character;

  // * EQUATABLE
  @override
  List<Object?> get props => [character];

  // * INIT
  const DetailState({required this.status, this.character});

  // * FUNCTIONS
  DetailState copyWith({required BlocStatus status, Character? character}) {
    return DetailState(status: status, character: character ?? this.character);
  }
}

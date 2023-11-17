part of 'home_bloc.dart';

class HomeState extends Equatable {
  // * PROPERTIES
  final BlocStatus status;
  final List<Character> characters;

  // * EQUATABLE
  @override
  List<Object?> get props => [status, characters];

  // * INIT
  const HomeState({required this.status, this.characters = const []});

  // * FUNCTIONS
  HomeState copyWith({required BlocStatus status, List<Character>? characters}) {
    return HomeState(status: status, characters: characters ?? this.characters);
  }
}

part of 'home_bloc.dart';

class HomeState extends Equatable {
  // * PROPERTIES
  final BlocStatus status;
  final bool hasNextPage;
  final int pageIndex;
  final List<Character> characters;

  // * EQUATABLE
  @override
  List<Object?> get props => [status, hasNextPage, pageIndex, characters];

  // * INIT
  const HomeState({required this.status, this.hasNextPage = true, this.pageIndex = 0, this.characters = const []});

  // * FUNCTIONS
  HomeState copyWith({required BlocStatus status, bool? hasNextPage, int? pageIndex, List<Character>? characters}) {
    return HomeState(
        status: status,
        hasNextPage: hasNextPage ?? this.hasNextPage,
        pageIndex: pageIndex ?? this.pageIndex,
        characters: characters ?? this.characters);
  }
}

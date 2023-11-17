import 'package:clean_rick_morty/data/repository/characters/characters_repository_interface.dart';
import 'package:clean_rick_morty/domain/entities/character.dart';
import 'package:clean_rick_morty/domain/use-cases/characters_use-cases/characters_use_cases_interface.dart';

class CharactersUseCases implements CharactersUseCasesInterface {
  final CharactersRepositoryInterface _repository;

  CharactersUseCases(this._repository);

  @override
  Future<List<Character>> getCharacters() async {
    return await _repository.getCharacters();
  }
}

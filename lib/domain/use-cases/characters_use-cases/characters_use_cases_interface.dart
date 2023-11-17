import 'package:clean_rick_morty/domain/entities/character.dart';

abstract class CharactersUseCasesInterface {
  Future<List<Character>> getCharacters();
}

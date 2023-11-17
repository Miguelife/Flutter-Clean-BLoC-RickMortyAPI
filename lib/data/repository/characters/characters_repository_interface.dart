import 'package:clean_rick_morty/domain/entities/character.dart';

abstract class CharactersRepositoryInterface {
  Future<List<Character>> getCharacters();
}

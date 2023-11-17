import '../../../domain/entities/character.dart';

abstract class CharactersDatasourceInterface {
  Future<List<Character>> getCharacters();
}

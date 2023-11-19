import '../../../domain/entities/character_page.dart';

abstract class CharactersRepositoryInterface {
  Future<CharacterPage> getCharacterPage({required int index});
}

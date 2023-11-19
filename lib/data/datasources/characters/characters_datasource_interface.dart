import '../../../domain/entities/character_page.dart';

abstract class CharactersDatasourceInterface {
  Future<CharacterPage> getCharacterPage({required int index});
}

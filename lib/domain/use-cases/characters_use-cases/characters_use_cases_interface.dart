import 'package:clean_rick_morty/domain/entities/character.dart';
import 'package:clean_rick_morty/domain/entities/character_page.dart';

abstract class CharactersUseCasesInterface {
  Future<CharacterPage> getCharacterPage({required int index});
  Future<Character> getCharacter({required int id});
}

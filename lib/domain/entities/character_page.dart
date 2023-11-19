import 'package:clean_rick_morty/data/dto/characters/character_page_dto.dart';
import 'package:clean_rick_morty/domain/entities/character.dart';

class CharacterPage {
  bool hasNextPage;
  int index;
  List<Character> characters;

  CharacterPage.from({required CharacterPageDTO dto, required this.index})
      : hasNextPage = dto.info?.next != null,
        characters = dto.results?.map((e) => Character.from(dto: e)).toList() ?? [];
}

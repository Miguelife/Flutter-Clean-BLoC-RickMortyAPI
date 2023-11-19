import '../../data/dto/characters/character_dto.dart';

class Character {
  int id;
  List<String> episodes;
  String name;
  String imageURL;

  Character.from({required CharacterDTO dto})
      : name = dto.name ?? "",
        imageURL = dto.image ?? "",
        id = dto.id ?? 0,
        episodes = dto.episode ?? [];
}

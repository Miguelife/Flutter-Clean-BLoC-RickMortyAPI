import '../../data/dto/characters/character_dto.dart';

class Character {
  String name;
  String imageURL;

  Character.from({required CharacterDTO dto})
      : name = dto.name ?? "",
        imageURL = dto.image ?? "";
}

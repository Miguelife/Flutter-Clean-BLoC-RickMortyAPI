import 'package:clean_rick_morty/data/dto/characters/character_dto.dart';

class CharacterPageDTO {
  InfoDTO? info;
  List<CharacterDTO>? results;

  CharacterPageDTO({this.info, this.results});

  CharacterPageDTO.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? InfoDTO.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <CharacterDTO>[];
      json['results'].forEach((v) {
        results!.add(CharacterDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InfoDTO {
  int? count;
  int? pages;
  String? next;
  String? prev;

  InfoDTO({this.count, this.pages, this.next, this.prev});

  InfoDTO.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}

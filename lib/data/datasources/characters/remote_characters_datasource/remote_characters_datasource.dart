import 'package:clean_rick_morty/data/datasources/characters/characters_datasource_interface.dart';
import 'package:clean_rick_morty/data/dto/characters/character_page_dto.dart';
import 'package:clean_rick_morty/di/dependencies.dart';
import 'package:clean_rick_morty/domain/entities/character.dart';
import 'package:dio/dio.dart';

class RemoteCharactersDataSource implements CharactersDatasourceInterface {
  @override
  Future<List<Character>> getCharacters() async {
    Response response = await Dio().get("${Dependencies.baseURL}/character");
    final dto = CharacterPageDTO.fromJson(response.data);
    return dto.results?.map((e) => Character.from(dto: e)).toList() ?? [];
  }
}

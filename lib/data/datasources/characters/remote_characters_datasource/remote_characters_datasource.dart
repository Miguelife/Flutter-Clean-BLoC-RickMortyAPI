import 'package:clean_rick_morty/data/datasources/characters/characters_datasource_interface.dart';
import 'package:clean_rick_morty/data/dto/characters/character_page_dto.dart';
import 'package:clean_rick_morty/di/dependencies.dart';
import 'package:clean_rick_morty/domain/entities/character_page.dart';
import 'package:dio/dio.dart';

class RemoteCharactersDataSource implements CharactersDatasourceInterface {
  @override
  Future<CharacterPage> getCharacterPage({required int index}) async {
    Response response = await Dio().get("${Dependencies.baseURL}/character?page=$index");
    final dto = CharacterPageDTO.fromJson(response.data);
    return CharacterPage.from(dto: dto, index: index);
  }
}

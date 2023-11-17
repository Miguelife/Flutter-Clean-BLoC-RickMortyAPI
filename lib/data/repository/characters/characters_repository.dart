import 'package:clean_rick_morty/data/datasources/characters/characters_datasource_interface.dart';
import 'package:clean_rick_morty/data/repository/characters/characters_repository_interface.dart';
import 'package:clean_rick_morty/domain/entities/character.dart';

class CharactersRepository implements CharactersRepositoryInterface {
  final CharactersDatasourceInterface _dataSource;

  CharactersRepository(this._dataSource);

  @override
  Future<List<Character>> getCharacters() async {
    return await _dataSource.getCharacters();
  }
}

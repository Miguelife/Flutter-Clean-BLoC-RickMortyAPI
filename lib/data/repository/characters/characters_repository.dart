import 'package:clean_rick_morty/data/datasources/characters/characters_datasource_interface.dart';
import 'package:clean_rick_morty/data/repository/characters/characters_repository_interface.dart';
import '../../../domain/entities/character_page.dart';

class CharactersRepository implements CharactersRepositoryInterface {
  final CharactersDatasourceInterface _dataSource;

  CharactersRepository(this._dataSource);

  @override
  Future<CharacterPage> getCharacterPage({required int index}) async {
    return await _dataSource.getCharacterPage(index: index);
  }
}

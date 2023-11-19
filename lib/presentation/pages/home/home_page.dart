import 'package:clean_rick_morty/presentation/pages/home/bloc/home_bloc.dart';
import 'package:clean_rick_morty/core/bloc/bloc_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/character.dart';

// * WIDGET
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// * STATE
class _HomePageState extends State<HomePage> {
  // * PROPERTIES
  final ScrollController _scrollController = ScrollController();
  late HomeBloc _bloc;

  // * LIFECYCLE
  @override
  void initState() {
    _bloc = BlocProvider.of<HomeBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent >= _scrollController.position.pixels - 50 &&
          _bloc.state.status != BlocStatus.loading &&
          _bloc.state.hasNextPage) {
        _bloc.add(const HomeLoadCharactersEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  // * WIDGETS
  Widget _body() {
    return _bodyByState();
  }

  Widget _bodyByState() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      switch (state.status) {
        case BlocStatus.initial:
          return _initialBody();
        case BlocStatus.loading:
          return _bloc.state.characters.isEmpty ? _loadingBody() : _charactersListBody();
        case BlocStatus.error:
          return _errorBody();
        case BlocStatus.success:
          return _charactersListBody();
      }
    });
  }

  Widget _initialBody() {
    return Center(
        child: ElevatedButton(
            onPressed: () => _bloc.add(const HomeLoadCharactersEvent()), child: const Text("LOAD INFO")));
  }

  Widget _loadingBody() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _errorBody() {
    return const Center(child: Text("ERROR"));
  }

  Widget _charactersListBody() {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _bloc.state.characters.length + (_bloc.state.status == BlocStatus.loading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _bloc.state.characters.length && _bloc.state.status == BlocStatus.loading) {
                return _loadingMoreCharactersIndicator();
              }
              return _characterTile(_bloc.state.characters[index]);
            }));
  }

  Widget _loadingMoreCharactersIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      ),
    );
  }

  Widget _characterTile(Character character) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.75,
                child: Image.network(character.imageURL),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(character.name)
            ],
          ),
        ],
      ),
    );
  }
}

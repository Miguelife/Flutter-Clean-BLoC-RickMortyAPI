import 'package:clean_rick_morty/presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/bloc_status.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // * PROPERTIES
  late DetailBloc _bloc;

  // * LIFECYCLE
  @override
  void initState() {
    _bloc = BlocProvider.of<DetailBloc>(context);
    _bloc.add(DetailGetCharacterEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyByState(),
    );
  }

  // * WIDGETS
  Widget _bodyByState() {
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      switch (state.status) {
        case BlocStatus.initial || BlocStatus.loading:
          return _loadingBody();
        case BlocStatus.error:
          return _errorBody();
        case BlocStatus.success:
          return _successBody();
      }
    });
  }

  Widget _loadingBody() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _errorBody() {
    return const Center(child: Text("ERROR"));
  }

  Widget _successBody() {
    if (_bloc.state.character == null) {
      _errorBody();
    }
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.network(
        _bloc.state.character!.imageURL,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(_bloc.state.character!.name, style: const TextStyle(fontSize: 20)),
      ),
      const SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _bloc.state.character!.episodes.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16),
          child: Text(_bloc.state.character!.episodes[index], style: const TextStyle(fontSize: 18)),
        ),
      ),
      const SizedBox(height: 30),
    ]));
  }
}

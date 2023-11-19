part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailGetCharacterEvent extends DetailEvent {
  final int id;
  const DetailGetCharacterEvent({required this.id});
}

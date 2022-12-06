part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadNews extends HomeEvent {
  final int page;

  const LoadNews({required this.page});

  @override
  List<Object> get props => [page];
}

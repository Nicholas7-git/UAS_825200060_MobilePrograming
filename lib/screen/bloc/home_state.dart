part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class NewsLoading extends HomeState {}

class NewsLoaded extends HomeState {
  final TopHeadlines topHeadlines;

  const NewsLoaded({required this.topHeadlines});

  @override
  List<Object> get props => [topHeadlines];
}

class NewsError extends HomeState {
  final String message;

  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}

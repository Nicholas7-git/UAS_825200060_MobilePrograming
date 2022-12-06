import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_money/data/model/top_headlines.dart';
import 'package:one_money/data/repositories/news_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final NewsRepository newsRepository = NewsRepository();

    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final TopHeadlines topHeadlines =
            await newsRepository.fetchTopHeadlines(page: event.page);
        emit(NewsLoaded(topHeadlines: topHeadlines));
      } catch (error) {
        emit(NewsError(message: error.toString()));
      }
    });
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:movia_app_bloc/controller/bloc/movie_event.dart';
import 'package:movia_app_bloc/controller/bloc/movie_state.dart';
import 'package:movia_app_bloc/data/repos/movie_repo.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepo movieRepo;

  MovieBloc(this.movieRepo) : super(MovieInitial()) {
    on<GetTrendingMovies>(_onTrendingMovies);
  }

  Future<void> _onTrendingMovies(
      GetTrendingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());

    try {
      final result = await movieRepo.getMovies();

      // log("Movies: ${result.results}");
      emit(MovieSucces(moviesList: result.results ?? []));
    } catch (e) {
      emit(MovieError(errorMessage: e.toString()));
    }
  }
}

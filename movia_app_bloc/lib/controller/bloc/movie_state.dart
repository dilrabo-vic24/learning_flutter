import 'package:equatable/equatable.dart';
import 'package:movia_app_bloc/data/models/movie_model.dart';

abstract class MovieState extends Equatable {}

class MovieInitial extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieError extends MovieState {
  final String errorMessage;

  MovieError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class MovieSucces extends MovieState{
  final List<Result>  moviesList;

  MovieSucces({required this.moviesList});
  @override
  List<Object?> get props => [moviesList];

}
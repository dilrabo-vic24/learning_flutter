import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {}

class GetTrendingMovies extends MovieEvent {
  @override
  List<Object?> get props => [];
}

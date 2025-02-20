import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movia_app_bloc/common/constants.dart';
import 'package:movia_app_bloc/data/models/movie_detail/get_movie_detail_dto.dart';
import 'package:movia_app_bloc/data/models/movie_model.dart';

class MovieRepo {
  final Dio dio = Dio();

  Future<MovieModel> getMovies() async {
    final url = "${NetworkConstants.baseUrl}/3/trending/movie/day";

    try {
      final response = await dio.get(url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": NetworkConstants.apiAccessToken
          }));

      // log(response.data);
      if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      } else {
        log("error while getting movies");
        throw Exception("Error while getting movies");
      }
    } catch (e) {
      log("error: $e");
      throw Exception("Unknowing error");
    }
  }

  Future<GetMovieDetailDto> getMovieDetail({required int movieId}) async {
    final url = "${NetworkConstants.baseUrl}/3/movie/$movieId/videos";

    try {
      final response = await dio.get(url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": NetworkConstants.apiAccessToken
          }));
      log("response: ${response.statusCode}");
      if (response.statusCode == 200) {
        log("response movie details: ${response.data}");
        final result = GetMovieDetailDto.fromJson(response.data);
        log("nimadir $result");
        return result;
      }
      return GetMovieDetailDto();
    } catch (e) {
      log("error: $e");
      throw Exception("Unknown error");
    }
  }
}

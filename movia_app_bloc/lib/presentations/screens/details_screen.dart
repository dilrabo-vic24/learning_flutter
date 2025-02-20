import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:movia_app_bloc/common/enums/statuses.dart';
import 'package:movia_app_bloc/common/utils/app_colors.dart';
import 'package:movia_app_bloc/controller/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movia_app_bloc/data/models/movie_model.dart';
import 'package:movia_app_bloc/presentations/widgets/custom_text_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Result movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final movieDetailsBloc = context.watch<MovieDetailBloc>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        bloc: movieDetailsBloc,
        builder: (context, state) {
          if (state.status == Statuses.Loading) {
            // log("loading");
            return Center(child: CircularProgressIndicator());
          } else if (state.status == Statuses.Error) {
            return CustomTextWidget(text: "error: ${state.errorMessage}");
          } else if (state.status == Statuses.Succes) {
            // final movie = state.movieDetails!.movieDetailResults![0];

            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                          flags: YoutubePlayerFlags(
                              autoPlay: false, loop: false, mute: false),
                          initialVideoId: state
                              .movieDetails!.movieDetailResults![0].key
                              .toString()),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.green,
                      progressColors: ProgressBarColors(
                          playedColor: Colors.red, handleColor: Colors.grey),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: CustomTextWidget(
                          text: "Name: ${widget.movie.title.toString()}",
                          fontWeight: FontWeight.bold,
                          textSize: 22)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "⭐ ${widget.movie.voteAverage} | 📅 ${widget.movie.releaseDate.toString().substring(0, 10)}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.movie.overview.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

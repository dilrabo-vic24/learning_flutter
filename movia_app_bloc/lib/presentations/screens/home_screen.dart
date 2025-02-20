import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movia_app_bloc/controller/bloc/movie_bloc.dart';
import 'package:movia_app_bloc/controller/bloc/movie_event.dart';
import 'package:movia_app_bloc/controller/bloc/movie_state.dart';
import 'package:movia_app_bloc/common/utils/app_colors.dart';
import 'package:movia_app_bloc/common/utils/app_icons.dart';
import 'package:movia_app_bloc/common/utils/app_images.dart';
import 'package:movia_app_bloc/controller/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movia_app_bloc/data/models/movie_model.dart';
import 'package:movia_app_bloc/presentations/screens/details_screen.dart';
import 'package:movia_app_bloc/presentations/widgets/custom_text_widget.dart';
import 'package:movia_app_bloc/presentations/widgets/filter_icon_widget.dart';
import 'package:movia_app_bloc/presentations/widgets/poster_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final movieBloc = context.read<MovieBloc>().add(GetTrendingMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Hello Daizy!",
                      textSize: 24,
                    ),
                    CustomTextWidget(
                      text: "Check for latest addition.",
                      textColor: AppColors.greyTextColor,
                    )
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: Image.asset(AppImages.profileImage))
              ],
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "Search",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15),
            //       borderSide: BorderSide(
            //         color: const Color.fromARGB(38, 212, 212, 212),
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15),
            //       borderSide: BorderSide(
            //         color: const Color.fromARGB(38, 212, 212, 212),
            //       ),
            //     ),
            //     prefixIcon: Icon(Icons.search, cMuolor: Colors.white),
            //   ),
            // ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (state is MovieSucces) {
                      showSearch(
                          context: context,
                          delegate:
                              MovieSearchDelegate(allMovies: state.moviesList));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.search, color: AppColors.greyTextColor),
                        CustomTextWidget(
                            text: "Search",
                            textColor: AppColors.greyTextColor,
                            textSize: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
            CustomTextWidget(text: "Filter", textSize: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterWidgets(
                  imageUrl: AppIcons.genreIcon,
                  text: "Genre",
                ),
                FilterWidgets(
                  imageUrl: AppIcons.starIcon,
                  text: "Top IMDB",
                ),
                FilterWidgets(
                  imageUrl: AppIcons.languageIcon,
                  text: "Language",
                ),
                FilterWidgets(
                  imageUrl: AppIcons.watchedIcon,
                  text: "Watched",
                ),
              ],
            ),
            CustomTextWidget(
                text: "Featured Series",
                textAlign: TextAlign.start,
                textSize: 24),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is MovieSucces) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.moviesList.length,
                      itemBuilder: (context, index) {
                        final movie = state.moviesList[index];
                        return GestureDetector(
                          onTap: () {
                            context.read<MovieDetailBloc>().add(
                                MovieDetailEvent.getMovieDetails(
                                    movieId: movie.id!));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movie: movie),
                                ));
                          },
                          child: PosterWidget(posterUrl: movie.posterPath!),
                        );
                      },
                    ),
                  );
                }
                if (state is MovieError) {
                  return Center(
                    child: CustomTextWidget(text: state.errorMessage),
                  );
                }
                log(state.toString());
                return CustomTextWidget(text: "Unknown error");
              },
            )
          ],
        ),
      ),
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  final List<Result> allMovies;

  MovieSearchDelegate({required this.allMovies});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Result> results = allMovies
        .where(
            (movie) => movie.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index].title!,
                style: TextStyle(color: Colors.white)),
            onTap: () {
              log("nimadir");
              context.read<MovieDetailBloc>().add(
                  MovieDetailEvent.getMovieDetails(
                      movieId: results[index].id!));
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: results[index]),
                  ));
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Result> suggestions = allMovies
        .where(
            (movie) => movie.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].title!,
                style: TextStyle(color: Colors.white)),
            onTap: () {
              query = suggestions[index].title!;
              showResults(context);
              context.read<MovieDetailBloc>().add(
                  MovieDetailEvent.getMovieDetails(
                      movieId: suggestions[index].id!));
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(movie: suggestions[index]),
                  ));
            },
          );
        },
      ),
    );
  }
}

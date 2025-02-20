import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  final String posterUrl;
  const PosterWidget({
    super.key,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 30, bottom: 20),
      child: SizedBox(
        height: 250,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.network("https://image.tmdb.org/t/p/w500$posterUrl")),
      ),
    );
  }
}
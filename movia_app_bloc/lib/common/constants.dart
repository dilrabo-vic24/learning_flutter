class NetworkConstants {
  static const String apiAccessToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzIxZGZkOTkyZTE5N2NhMTFhMWY3YzBhNjk4YjlmYiIsIm5iZiI6MTczOTgwNDY2MC42ODk5OTk4LCJzdWIiOiI2N2IzNGZmNGU5ZWUzZGNjNzdlMGRkYjIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.M9WcesnCxqpTrRXUc8BjxV6VGtgF58CeiRA25o7XTYU";
  static const String apiKey = "0721dfd992e197ca11a1f7c0a698b9fb";

    static const baseUrl = "https://api.themoviedb.org";

}

//example
  // curl --request GET \
  //  --url 'https://api.themoviedb.org/3/trending/movie/day?language=en-US' \
  //  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NDRkZTFjM2ZjYTMyMzY2MGZmMDg0ODFkZDkxYzdjMCIsIm5iZiI6MTczOTc2NTk4NC44NDQsInN1YiI6IjY3YjJiOGUwZTllZTNkY2M3N2UwY2MyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D-oU5Gng-pcEnF07umjVboxYGvk4JgBQobXTB-GcASU' \
  //  --header 'accept: application/json'
import 'package:flutter_architecture/src/models/item_model.dart';
import 'package:flutter_architecture/src/models/trailer_model.dart';
import 'package:flutter_architecture/src/resources/movie_api_provider.dart';

class Repository {
  final MovieApiProvider moviesApiProvider;

  Repository(this.moviesApiProvider);

  Future<ItemModel> fetchMovieList() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
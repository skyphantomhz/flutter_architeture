import 'package:flutter_architecture/src/blocs/bloc_base.dart';
import 'package:flutter_architecture/src/models/item_model.dart';
import 'package:flutter_architecture/src/resources/repository.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository;
  PublishSubject<ItemModel> _moviesFetcher;

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  @provide
  MoviesBloc(this._repository);

  init() {
    _moviesFetcher = PublishSubject<ItemModel>();
  }

  fetAllMovies() async {
    ItemModel itemModel = await _repository.fetchMovieList();
    _moviesFetcher.sink.add(itemModel);
  }

  @override
  void dispose() {
    _moviesFetcher.close();
  }
}

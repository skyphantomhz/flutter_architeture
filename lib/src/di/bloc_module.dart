import 'package:flutter_architecture/src/blocs/bloc_base.dart';
import 'package:flutter_architecture/src/blocs/movie_detail_bloc.dart';
import 'package:flutter_architecture/src/blocs/movies_bloc.dart';
import 'package:flutter_architecture/src/resources/movie_api_provider.dart';
import 'package:flutter_architecture/src/resources/repository.dart';
import 'package:http/http.dart';
import 'package:inject/inject.dart';

@module
class BlocModule{

  @provide
  @singleton
  Client client() => Client();

  @provide
  @singleton
  MovieApiProvider movieApiProvider(Client client) => MovieApiProvider(client);


  @provide
  @singleton
  Repository repository(MovieApiProvider movieApiProvider) => Repository(movieApiProvider);

  @provide
  @singleton
  BlocBase movieBloc(Repository repository) => MoviesBloc(repository);

  @provide
  @singleton
  BlocBase movieDetailBloc(Repository repository) => MovieDetailBloc(repository);
  
}
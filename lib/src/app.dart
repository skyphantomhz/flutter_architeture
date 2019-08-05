import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/ui/movie_detail.dart';
import 'package:flutter_architecture/src/ui/movie_list.dart';
import 'package:inject/inject.dart';

import 'blocs/movie_detail_bloc.dart';
import 'blocs/movies_bloc.dart';
import 'models/item_model.dart';

class App extends StatelessWidget{
  final MoviesBloc moviesBloc;
  final MovieDetailBloc movieDetailBloc;

@provide
App(this.moviesBloc, this.movieDetailBloc): super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: (settings){
        if(settings.name == 'movieDetail'){
          final Result result = settings.arguments;
          return MaterialPageRoute(
            builder: (context){
              return MovieDetail(
                bloc: movieDetailBloc,
                title: result.title,
                posterUrl: result.backdrop_path,
                description: result.overview,
                releaseDate: result.release_date,
                voteAverage: result.vote_average.toString(),
                movieId: result.id
              );
            }
          );
        }
      },
      routes: {
        '/': (context) => MovieList(moviesBloc),
      },
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../features/movies/domain/entities/movie.dart';
import 'movie_item.dart';
/// Un widget que muestra una lista de películas en una cuadrícula
///
/// [movies] Lista de películas a mostrar,
///
/// [loadNextPage] Función para cargar una siguiente página, esta función se ejecuta cuando falten 200 pixeles para
/// que el usuario llegue al final de la lista
///
///[onClickMovie ] Una función que se llamará cuando se toque una película.
///
///[scrollPhysics] Controla cómo se comporta el desplazamiento de la cuadrícula.
class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  final void Function(Movie movie) onClickMovie;
  final ScrollPhysics scrollPhysics;
  final bool shrinkWrap;

  const MovieMasonry({
    super.key,
    required this.movies,
    this.loadNextPage,
    required this.onClickMovie,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,
  });

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (_scrollController.position.pixels + 200 >= _scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: _scrollController,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.scrollPhysics,
      itemCount: widget.movies.length,
      mainAxisSpacing: 36,
      crossAxisSpacing: 36,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return Container(
          margin: EdgeInsets.only(top: index == 1 ? 24.0 : 0.0),
          height: 250,
          child: MovieItem(
            movie: movie,
            onClickMovie: widget.onClickMovie,
          ),
        );
      },
    );
  }
}

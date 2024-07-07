import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../domain/entities/movie.dart';
import 'movie_item.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  final void Function(Movie movie) onClickMovie;

  const MovieMasonry({
    super.key,
    required this.movies,
    this.loadNextPage,
    required this.onClickMovie,
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
      if (_scrollController.position.pixels + 100 >= _scrollController.position.maxScrollExtent) {
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
      physics: const BouncingScrollPhysics(),
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

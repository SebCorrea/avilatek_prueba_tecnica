import 'package:avilatek_prueba_tecnica/features/home/domain/entities/Movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/ui/utils/ui_strings.dart';
import '../../../../core/ui/widgets/basic_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: UIStrings.home,
      ),
      body: const Padding(
        padding: EdgeInsets.all(36.0),
        child: _HomeView(),
      ),
    );
  }
}

final List<Movie> appMovies = [
  Movie(
    id: 200,
    adult: false,
    backdropPath: '',
    genreIds: [],
    originalLanguage: 'es',
    originalTitle: 'Test 1',
    overview: 'overview',
    popularity: 3.6,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'Test 1',
    video: false,
    voteAverage: 3.4,
    voteCount: 605,
  ),
  Movie(
    id: 200,
    adult: false,
    backdropPath: '',
    genreIds: [],
    originalLanguage: 'es',
    originalTitle: 'Test 2',
    overview: 'overview',
    popularity: 3.6,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'Test 1',
    video: false,
    voteAverage: 3.4,
    voteCount: 605,
  ),
  Movie(
    id: 200,
    adult: false,
    backdropPath: '',
    genreIds: [],
    originalLanguage: 'es',
    originalTitle: 'Test 3',
    overview: 'overview',
    popularity: 3.6,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'Test 1',
    video: false,
    voteAverage: 3.4,
    voteCount: 605,
  ),
  Movie(
    id: 200,
    adult: false,
    backdropPath: '',
    genreIds: [],
    originalLanguage: 'es',
    originalTitle: 'Test 3',
    overview: 'overview',
    popularity: 3.6,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'Test 1',
    video: false,
    voteAverage: 3.4,
    voteCount: 605,
  ),
  Movie(
    id: 200,
    adult: false,
    backdropPath: '',
    genreIds: [],
    originalLanguage: 'es',
    originalTitle: 'Test 3',
    overview: 'overview',
    popularity: 3.6,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'Test 1',
    video: false,
    voteAverage: 3.4,
    voteCount: 605,
  ),
];

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _MovieList()),
      ],
    );
  }
}

class _MovieList extends StatelessWidget {
  const _MovieList();

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: appMovies.length,
      mainAxisSpacing: 36,
      crossAxisSpacing: 36,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        final movie = appMovies[index];
        return Container(
          margin: EdgeInsets.only(top: index == 1 ? 24.0 : 0.0),
          height: 250,
          child: _MovieItem(movie: movie),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

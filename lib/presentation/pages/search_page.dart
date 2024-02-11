import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/search_movies_page.dart';
import 'package:tv/presentation/pages/search_tv_page.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [Text('Movies'), Text('TV Series')],
          ),
          title: const Text('Search'),
        ),
        body: TabBarView(
          children: [
            SearchMoviesPage(),
            SearchTvPage(),
          ],
        ),
      ),
    );
  }
}

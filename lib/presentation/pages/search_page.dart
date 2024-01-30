import 'package:ditonton/presentation/pages/search_movies_page.dart';
import 'package:ditonton/presentation/pages/search_tv_page.dart';
import 'package:flutter/material.dart';

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
          title: Text('Search'),
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

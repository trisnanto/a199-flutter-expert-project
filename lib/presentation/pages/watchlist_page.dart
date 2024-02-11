import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/watchlist_movies_page.dart';
import 'package:tv/presentation/pages/watchlist_tv_page.dart';

class WatchlistPage extends StatelessWidget {
  static const ROUTE_NAME = '/watchlist';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [Text('Movies'), Text('TV Series')],
          ),
          title: const Text('Watchlist'),
        ),
        body: TabBarView(
          children: [
            WatchlistMoviesPage(),
            WatchlistTvPage(),
          ],
        ),
      ),
    );
  }
}

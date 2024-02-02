import 'package:core/presentation/pages/home_movie_page.dart';
import 'package:core/presentation/pages/home_tv_page.dart';
import 'package:core/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:core/utils/routes.dart';

class HomePage extends StatelessWidget {
  final int selectedTab;
  const HomePage({super.key, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedTab,
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('ditonton@dicoding.com'),
              ),
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Movies'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomePage(selectedTab: 0)),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.tv),
                title: const Text('TV Series'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomePage(selectedTab: 1)),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Watchlist'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ABOUT_ROUTE);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [Text('Movies'), Text('TV Series')],
          ),
          title: const Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SEARCH_ROUTE);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: TabBarView(
          children: [
            HomeMoviePage(),
            HomeTvPage(),
          ],
        ),
      ),
    );
  }
}

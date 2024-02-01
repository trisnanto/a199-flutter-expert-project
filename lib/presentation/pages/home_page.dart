import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/home_tv_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';

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
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('ditonton@dicoding.com'),
              ),
              ListTile(
                leading: Icon(Icons.movie),
                title: Text('Movies'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage(selectedTab: 0)),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.tv),
                title: Text('TV Series'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage(selectedTab: 1)),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.save_alt),
                title: Text('Watchlist'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                },
                leading: Icon(Icons.info_outline),
                title: Text('About'),
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
                Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
              },
              icon: Icon(Icons.search),
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

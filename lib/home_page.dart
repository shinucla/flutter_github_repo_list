/*
 * home page widget providing list view of the git hub repos
 */

import 'package:flutter/material.dart';

import 'github_repo.dart';
import 'github_repo_item.dart';
import 'net_access_api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<GithubRepo> _repos = List();
  bool _isFetching = false;
  String _error;

  @override void initState() {
    super.initState();
    _loadTrendingRepos();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,
                      title: Container( margin: EdgeInsets.only(top: 4.0),
                                        child: Row( children: <Widget>[ Text('Github Repos',
                                                                             style: (Theme
                                                                                     .of(context)
                                                                                     .textTheme
                                                                                     .headline
                                                                                     .apply(color: Colors.white))
                                                                            ),
                                                                        Text('HELLO WORLD',
                                                                             style: (Theme
                                                                                     .of(context)
                                                                                     .textTheme
                                                                                     .subhead
                                                                                     .apply(color: Colors.yellow))
                                                                            )]
                                                  )),
                      actions: <Widget>[
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                        IconButton(icon: Icon(Icons.cloud_download), onPressed: () {}),
                      ],
                    ),
      body: _createBody(context),
    );
  }

  void _loadTrendingRepos() async {
    setState(() {
      _isFetching = true;
      _error = null;
    });

    final repos = await NetAccessApi.getTrendingRepositories();
    setState(() {
      _isFetching = false;
      if (repos != null) {
        this._repos = repos;
      } else {
        _error = 'Error fetching repos';
      }
    });
  }

  Widget _createBody(BuildContext context) {
    if (_isFetching) {
      return Container( alignment: Alignment.center, child: Icon(Icons.timelapse) );

    } else if (_error != null) {
      return Container( alignment: Alignment.center,
                        child: Text(
                          _error,
                          style: Theme.of(context).textTheme.headline,
                        ));

    } else {
      return ListView.builder( padding: EdgeInsets.symmetric(vertical: 8.0),
                               itemCount: _repos.length,
                               itemBuilder: (BuildContext context, int index) {
                                 return GithubRepoItem(_repos[index]);
                               });
    }
  }
}

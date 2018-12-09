/*
 * Widget view unit for each git hub repo oject
 */

import 'package:flutter/material.dart';

import 'github_repo.dart';

class GithubRepoItem extends StatelessWidget {
  final GithubRepo repo;
  GithubRepoItem(this.repo);

  @override Widget build(BuildContext context) {
    return Card( child: InkWell( highlightColor: Colors.lightBlueAccent,
                                 splashColor: Colors.red,
                                 child: Container( padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                                   child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: <Widget>[
                                                       _createRepoName(repo, context),
                                                       _createRepoDescription(repo, context),
                                                       _createRepoInfoRow(repo, context)
                                                     ]),
                                                 )),
               );
  }

  Widget _createRepoName(repo, context) {
    return Container(
      child: Text(repo.name != null ? repo.name : '-',
                  style: Theme.of(context).textTheme.subhead));
  }

  Widget _createRepoDescription(repo, context) {
    return Container(
      child: Padding( padding: EdgeInsets.only(top: 4.0),
                      child: Text(repo.description != null
                                  ? repo.description
                                  : 'No desription',
                                  style: Theme.of(context).textTheme.body1),
                    ));
  }

  Widget _createRepoInfoRow(repo, context) {
    return Container(
      child: Padding(padding: EdgeInsets.only(top: 8.0),
                     child: Row(
                       children: <Widget>[
                         _createRepoOwner(repo, context),
                         _createRepoFollower(repo, context),
                         _createRepoLanguage(repo, context)

                       ],
                     ),
                    ));
  }

  Widget _createRepoOwner(repo, context) {
    return Container(
      child: Expanded(child: Text(repo.owner != null ? repo.owner : '',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.caption)));
  }

  Widget _createRepoFollower(Repo, context) {
    return Container(
      child: Expanded( child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: <Widget>[
                                     Icon(
                                       Icons.star,
                                       color: Colors.deepOrange,
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(top: 4.0),
                                       child: Text(
                                         (repo.watchersCount != null)
                                           ? '${repo.watchersCount} '
                                           : '0 ',
                                         textAlign: TextAlign.center,
                                         style: Theme.of(context).textTheme.caption),
                                     ),
                                   ],
                                 ),
                     ));
  }

  Widget _createRepoLanguage(repo, context) {
    return Container(
      child: Expanded(
        child: Text(repo.language != null ? repo.language : '',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.caption)));
  }
}

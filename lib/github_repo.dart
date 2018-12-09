/*
 * Model object class for git hub repo
 */

class GithubRepo {
  final String htmlUrl;
  final int watchersCount;
  final String language;
  final String description;
  final String name;
  final String owner;

  GithubRepo(this.htmlUrl,
             this.watchersCount,
             this.language,
             this.description,
             this.name,
             this.owner);

  static List<GithubRepo> mapJSONStringToList(List<dynamic> jsonList) {
    return (jsonList
            .map((x) => GithubRepo(x['url'],
                                   x['watchers_count'],
                                   x['language'],
                                   x['description'],
                                   x['name'],
                                   x['owner']['login']))
            .toList());
  }

  static List<GithubRepo> mockList() {
    return (List()
            ..add(GithubRepo('www', 50, 'java', 'description', 'Test 01', 'Anna'))
  	    ..add(GithubRepo('www', 50, 'java', 'description', 'Test 02', 'Kevin'))
            ..add(GithubRepo('www', 50, 'java', 'description', 'Test 03', 'John'))
  	   );
  }
}

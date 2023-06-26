import 'dart:convert';

class GitInfos {
  String repoCloneUrl;
  String branch;
  GitInfos({
    required this.repoCloneUrl,
    required this.branch,
  });

  GitInfos copyWith({
    String? repoCloneUrl,
    String? branch,
  }) {
    return GitInfos(
      repoCloneUrl: repoCloneUrl ?? this.repoCloneUrl,
      branch: branch ?? this.branch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'repo_clone_url': repoCloneUrl,
      'branch': branch,
    };
  }

  factory GitInfos.fromMap(Map<String, dynamic> map) {
    return GitInfos(
      repoCloneUrl: map['repo_clone_url'] ?? '',
      branch: map['branch'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GitInfos.fromJson(String source) =>
      GitInfos.fromMap(json.decode(source));

  @override
  String toString() =>
      'GitInfosModel(repoCloneUrl: $repoCloneUrl, branch: $branch)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GitInfos &&
        other.repoCloneUrl == repoCloneUrl &&
        other.branch == branch;
  }

  @override
  int get hashCode => repoCloneUrl.hashCode ^ branch.hashCode;
}

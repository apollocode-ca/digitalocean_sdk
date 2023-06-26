import 'dart:convert';

class Service {
  String name;
  String? sourceCommitHash;
  Service({
    required this.name,
    this.sourceCommitHash,
  });

  Service copyWith({
    String? name,
    String? sourceCommitHash,
  }) {
    return Service(
      name: name ?? this.name,
      sourceCommitHash: sourceCommitHash ?? this.sourceCommitHash,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'source_commit_hash': sourceCommitHash,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      name: map['name'] ?? '',
      sourceCommitHash: map['source_commit_hash'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));

  @override
  String toString() =>
      'Service(name: $name, sourceCommitHash: $sourceCommitHash)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Service &&
        other.name == name &&
        other.sourceCommitHash == sourceCommitHash;
  }

  @override
  int get hashCode => name.hashCode ^ sourceCommitHash.hashCode;
}

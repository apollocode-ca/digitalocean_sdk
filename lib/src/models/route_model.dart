import 'dart:convert';

class Route {
  String? path;
  Route({
    this.path,
  });

  Route copyWith({
    String? path,
  }) {
    return Route(
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
    };
  }

  factory Route.fromMap(Map<String, dynamic> map) {
    return Route(
      path: map['path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Route.fromJson(String source) =>
      Route.fromMap(json.decode(source));

  @override
  String toString() => 'ServiceRoute(path: $path)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Route && other.path == path;
  }

  @override
  int get hashCode => path.hashCode;
}

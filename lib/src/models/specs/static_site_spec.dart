import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:digitalocean/src/models/env_variable_model.dart';
import 'package:digitalocean/src/models/git_infos_model.dart';
import 'package:digitalocean/src/models/route_model.dart';

class StaticSiteSpec {
  String name;
  GitInfos? git;
  String? environmentSlug;
  List<EnvVariableModel>? envs;
  List<Route>? routes;
  String? indexDocument;
  String? catchallDocument;
  String? errorDocument;

  StaticSiteSpec({
    required this.name,
    this.git,
    this.environmentSlug,
    this.envs,
    this.routes,
    this.indexDocument,
    this.catchallDocument,
    this.errorDocument,
  });

  StaticSiteSpec copyWith({
    String? name,
    GitInfos? git,
    String? runCommand,
    String? environmentSlug,
    List<EnvVariableModel>? envs,
    List<Route>? routes,
    String? indexDocument,
    String? catchallDocument,
    String? errorDocument,
  }) {
    return StaticSiteSpec(
      name: name ?? this.name,
      git: git ?? this.git,
      environmentSlug: environmentSlug ?? this.environmentSlug,
      envs: envs ?? this.envs,
      routes: routes ?? this.routes,
      indexDocument: indexDocument ?? this.indexDocument,
      catchallDocument: catchallDocument ?? this.catchallDocument,
      errorDocument: errorDocument ?? this.errorDocument,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'git': git?.toMap(),
      'environment_slug': environmentSlug,
      'envs': envs?.map((x) => x.toMap()).toList(),
      'routes': routes?.map((x) => x.toMap()).toList(),
      'index_document': indexDocument,
      'catchall_document': catchallDocument,
      'error_document': errorDocument,
    };
  }

  factory StaticSiteSpec.fromMap(Map<String, dynamic> map) {
    return StaticSiteSpec(
      name: map['name'] ?? '',
      git: map['git'] != null ? GitInfos.fromMap(map['git']) : null,
      environmentSlug: map['environment_slug'],
      envs: map['envs'] != null
          ? List<EnvVariableModel>.from(
              map['envs']?.map((x) => EnvVariableModel.fromMap(x)))
          : null,
      routes: map['routes'] != null
          ? List<Route>.from(map['routes']?.map((x) => Route.fromMap(x)))
          : null,
      indexDocument: map['index_document'],
      catchallDocument: map['catchall_document'],
      errorDocument: map['error_document'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StaticSiteSpec.fromJson(String source) =>
      StaticSiteSpec.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StaticSiteSpec(name: $name, git: $git, environmentSlug: $environmentSlug, envs: $envs, routes: $routes, indexDocument: $indexDocument, catchallDocument: $catchallDocument, errorDocument: $errorDocument)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is StaticSiteSpec &&
        other.name == name &&
        other.git == git &&
        other.environmentSlug == environmentSlug &&
        listEquals(other.envs, envs) &&
        listEquals(other.routes, routes) &&
        other.indexDocument == indexDocument &&
        other.catchallDocument == catchallDocument &&
        other.errorDocument == errorDocument;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        git.hashCode ^
        environmentSlug.hashCode ^
        envs.hashCode ^
        routes.hashCode ^
        indexDocument.hashCode ^
        catchallDocument.hashCode ^
        errorDocument.hashCode;
  }
}

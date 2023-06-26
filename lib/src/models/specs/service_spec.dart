import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:digitalocean/src/models/git_infos_model.dart';
import 'package:digitalocean/src/models/route_model.dart';

class ServiceSpec {
  String name;
  GitInfos? git;
  String? runCommand;
  String? environmentSlug;
  String instanceSizeSlug;
  int instanceCount;
  int httpPort;
  List<Route>? routes;
  ServiceSpec({
    required this.name,
    this.git,
    this.runCommand,
    this.environmentSlug,
    required this.instanceSizeSlug,
    required this.instanceCount,
    required this.httpPort,
    this.routes,
  });

  ServiceSpec copyWith({
    String? name,
    GitInfos? git,
    String? runCommand,
    String? environmentSlug,
    String? instanceSizeSlug,
    int? instanceCount,
    int? httpPort,
    List<Route>? routes,
  }) {
    return ServiceSpec(
      name: name ?? this.name,
      git: git ?? this.git,
      runCommand: runCommand ?? this.runCommand,
      environmentSlug: environmentSlug ?? this.environmentSlug,
      instanceSizeSlug: instanceSizeSlug ?? this.instanceSizeSlug,
      instanceCount: instanceCount ?? this.instanceCount,
      httpPort: httpPort ?? this.httpPort,
      routes: routes ?? this.routes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'git': git?.toMap(),
      'run_command': runCommand,
      'environment_slug': environmentSlug,
      'instance_size_slug': instanceSizeSlug,
      'instance_count': instanceCount,
      'http_port': httpPort,
      'routes': routes?.map((x) => x.toMap()).toList(),
    };
  }

  factory ServiceSpec.fromMap(Map<String, dynamic> map) {
    return ServiceSpec(
      name: map['name'] ?? '',
      git: map['git'] != null ? GitInfos.fromMap(map['git']) : null,
      runCommand: map['run_command'],
      environmentSlug: map['environment_slug'],
      instanceSizeSlug: map['instance_size_slug'] ?? '',
      instanceCount: map['instance_count']?.toInt() ?? 0,
      httpPort: map['http_port']?.toInt() ?? 0,
      routes: map['routes'] != null
          ? List<Route>.from(map['routes']?.map((x) => Route.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceSpec.fromJson(String source) =>
      ServiceSpec.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Spec(name: $name, git: $git, runCommand: $runCommand, environmentSlug: $environmentSlug, instanceSizeSlug: $instanceSizeSlug, instanceCount: $instanceCount, httpPort: $httpPort, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ServiceSpec &&
        other.name == name &&
        other.git == git &&
        other.runCommand == runCommand &&
        other.environmentSlug == environmentSlug &&
        other.instanceSizeSlug == instanceSizeSlug &&
        other.instanceCount == instanceCount &&
        other.httpPort == httpPort &&
        listEquals(other.routes, routes);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        git.hashCode ^
        runCommand.hashCode ^
        environmentSlug.hashCode ^
        instanceSizeSlug.hashCode ^
        instanceCount.hashCode ^
        httpPort.hashCode ^
        routes.hashCode;
  }
}

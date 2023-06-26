import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:digitalocean/src/models/specs/domain_spec.dart';
import 'package:digitalocean/src/models/specs/service_spec.dart';

class AppSpec {
  String name;
  List<ServiceSpec> services;
  String? region;
  List<DomainSpec> domains;
  AppSpec({
    required this.name,
    required this.services,
    this.region,
    required this.domains,
  });

  AppSpec copyWith({
    String? name,
    List<ServiceSpec>? services,
    String? region,
    List<DomainSpec>? domains,
  }) {
    return AppSpec(
      name: name ?? this.name,
      services: services ?? this.services,
      region: region ?? this.region,
      domains: domains ?? this.domains,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'services': services.map((x) => x.toMap()).toList(),
      'region': region,
      'domains': domains.map((x) => x.toMap()).toList(),
    };
  }

  factory AppSpec.fromMap(Map<String, dynamic> map) {
    return AppSpec(
      name: map['name'] ?? '',
      services: map['services'] == null
          ? []
          : List<ServiceSpec>.from(
              map['services']?.map((x) => ServiceSpec.fromMap(x))),
      region: map['region'],
      domains: map['domains'] == null
          ? []
          : List<DomainSpec>.from(
              map['domains']?.map((x) => DomainSpec.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppSpec.fromJson(String source) =>
      AppSpec.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Spec(name: $name, services: $services, region: $region, domains: $domains)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is AppSpec &&
        other.name == name &&
        listEquals(other.services, services) &&
        other.region == region &&
        listEquals(other.domains, domains);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        services.hashCode ^
        region.hashCode ^
        domains.hashCode;
  }
}

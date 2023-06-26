import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:digitalocean/src/models/specs/app_spec.dart';

import 'service_model.dart';

class Deployment {
  String id;
  AppSpec spec;
  List<Service> services;
  DateTime phaseLastUpdatedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Deployment({
    required this.id,
    required this.spec,
    required this.services,
    required this.phaseLastUpdatedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  Deployment copyWith({
    String? id,
    AppSpec? spec,
    List<Service>? services,
    DateTime? phaseLastUpdatedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Deployment(
      id: id ?? this.id,
      spec: spec ?? this.spec,
      services: services ?? this.services,
      phaseLastUpdatedAt: phaseLastUpdatedAt ?? this.phaseLastUpdatedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spec': spec.toMap(),
      'services': services.map((x) => x.toMap()).toList(),
      'phase_last_updated_at': phaseLastUpdatedAt.millisecondsSinceEpoch,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Deployment.fromMap(Map<String, dynamic> map) {
    return Deployment(
      id: map['id'] ?? '',
      spec: AppSpec.fromMap(map['spec']),
      services: map['services'] == null
          ? []
          : List<Service>.from(map['services']?.map((x) => Service.fromMap(x))),
      phaseLastUpdatedAt: DateTime.parse(map['phase_last_updated_at']),
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Deployment.fromJson(String source) =>
      Deployment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Deployment(id: $id, spec: $spec, services: $services, phaseLastUpdatedAt: $phaseLastUpdatedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Deployment &&
        other.id == id &&
        other.spec == spec &&
        listEquals(other.services, services) &&
        other.phaseLastUpdatedAt == phaseLastUpdatedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        spec.hashCode ^
        services.hashCode ^
        phaseLastUpdatedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}

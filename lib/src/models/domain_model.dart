import 'dart:convert';

import 'package:digitalocean/src/models/specs/domain_spec.dart';

class Domain {
  String id;
  String phase;
  DomainSpec spec;

  Domain({required this.id, required this.phase, required this.spec});

  Domain copyWith({
    String? id,
    String? phase,
    DomainSpec? spec,
  }) {
    return Domain(
      id: id ?? this.id,
      phase: phase ?? this.phase,
      spec: spec ?? this.spec,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phase': phase,
    };
  }

  factory Domain.fromMap(Map<String, dynamic> map) {
    return Domain(
      id: map['id'] ?? '',
      phase: map['phase'] ?? '',
      spec: DomainSpec.fromMap(map['spec']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Domain.fromJson(String source) => Domain.fromMap(json.decode(source));

  @override
  String toString() => 'Domain(id: $id, phase: $phase)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Domain && other.id == id && other.phase == phase;
  }

  @override
  int get hashCode => id.hashCode ^ phase.hashCode;
}

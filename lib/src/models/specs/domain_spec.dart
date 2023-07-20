import 'dart:convert';

class DomainSpec {
  String domain;
  String? type;
  String? zone;
  String minimumTlsVersion;
  DomainSpec({
    required this.domain,
    this.type,
    this.zone,
    required this.minimumTlsVersion,
  });

  DomainSpec copyWith({
    String? domain,
    String? type,
    String? zone,
    String? minimumTlsVersion,
  }) {
    return DomainSpec(
      domain: domain ?? this.domain,
      type: type ?? this.type,
      zone: zone ?? this.zone,
      minimumTlsVersion: minimumTlsVersion ?? this.minimumTlsVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'domain': domain,
      'type': type,
      'zone': zone,
      'minimum_tls_version': minimumTlsVersion,
    };
  }

  factory DomainSpec.fromMap(Map<String, dynamic> map) {
    return DomainSpec(
      domain: map['domain'] ?? '',
      type: map['type'] ?? '',
      zone: map['zone'] ?? '',
      minimumTlsVersion: map['minimum_tls_version'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DomainSpec.fromJson(String source) => DomainSpec.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Domain(domain: $domain, type: $type, zone: $zone, minimumTlsVersion: $minimumTlsVersion)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DomainSpec &&
      other.domain == domain &&
      other.type == type &&
      other.zone == zone &&
      other.minimumTlsVersion == minimumTlsVersion;
  }

  @override
  int get hashCode {
    return domain.hashCode ^
      type.hashCode ^
      zone.hashCode ^
      minimumTlsVersion.hashCode;
  }
}

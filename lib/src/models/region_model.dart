import 'dart:convert';

import 'package:collection/collection.dart';

class Region {
  String slug;
  String label;
  String flag;
  String continent;
  List<String> dataCenters;
  Region({
    required this.slug,
    required this.label,
    required this.flag,
    required this.continent,
    required this.dataCenters,
  });

  Region copyWith({
    String? slug,
    String? label,
    String? flag,
    String? continent,
    List<String>? dataCenters,
  }) {
    return Region(
      slug: slug ?? this.slug,
      label: label ?? this.label,
      flag: flag ?? this.flag,
      continent: continent ?? this.continent,
      dataCenters: dataCenters ?? this.dataCenters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slug': slug,
      'label': label,
      'flag': flag,
      'continent': continent,
      'data_centers': dataCenters,
    };
  }

  factory Region.fromMap(Map<String, dynamic> map) {
    return Region(
      slug: map['slug'] ?? '',
      label: map['label'] ?? '',
      flag: map['flag'] ?? '',
      continent: map['continent'] ?? '',
      dataCenters: List<String>.from(map['data_centers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Region.fromJson(String source) => Region.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Region(slug: $slug, label: $label, flag: $flag, continent: $continent, dataCenters: $dataCenters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Region &&
        other.slug == slug &&
        other.label == label &&
        other.flag == flag &&
        other.continent == continent &&
        listEquals(other.dataCenters, dataCenters);
  }

  @override
  int get hashCode {
    return slug.hashCode ^
        label.hashCode ^
        flag.hashCode ^
        continent.hashCode ^
        dataCenters.hashCode;
  }
}

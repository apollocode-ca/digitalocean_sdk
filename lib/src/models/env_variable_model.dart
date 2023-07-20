import 'dart:convert';

class EnvVariableModel {
  String key;
  String? scope;
  String? type;
  String value;
  EnvVariableModel({
    required this.key,
    this.scope,
    this.type,
    required this.value,
  });

  EnvVariableModel copyWith({
    String? key,
    String? scope,
    String? type,
    String? value,
  }) {
    return EnvVariableModel(
      key: key ?? this.key,
      scope: scope ?? this.scope,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'scope': scope,
      'type': type,
      'value': value,
    };
  }

  factory EnvVariableModel.fromMap(Map<String, dynamic> map) {
    return EnvVariableModel(
      key: map['key'] ?? '',
      scope: map['scope'],
      type: map['type'],
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EnvVariableModel.fromJson(String source) =>
      EnvVariableModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EnvVariableModel(key: $key, scope: $scope, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnvVariableModel &&
        other.key == key &&
        other.scope == scope &&
        other.type == type &&
        other.value == value;
  }

  @override
  int get hashCode {
    return key.hashCode ^ scope.hashCode ^ type.hashCode ^ value.hashCode;
  }
}

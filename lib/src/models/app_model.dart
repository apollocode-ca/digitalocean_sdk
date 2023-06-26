import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:digitalocean/src/models/deployment_model.dart';
import 'package:digitalocean/src/models/region_model.dart';
import 'package:digitalocean/src/models/specs/app_spec.dart';

class App {
  String id;
  String ownerUuid;
  AppSpec? spec;
  String? defaultIngress;
  DateTime? createdAt;
  DateTime? updatedAt;
  Deployment? activeDeployment;
  Deployment? pendingDeployment;
  Map<String, dynamic>? progress;
  DateTime? lastDeploymentCreatedAt;
  String? liveUrl;
  Region? region;
  String? tierSlug;
  String? liveUrlBase;
  String? liveDomain;
  List<String>? domains;
  App({
    required this.id,
    required this.ownerUuid,
    this.defaultIngress,
    this.createdAt,
    this.updatedAt,
    this.activeDeployment,
    this.pendingDeployment,
    this.progress,
    this.lastDeploymentCreatedAt,
    this.liveUrl,
    this.region,
    this.tierSlug,
    this.liveUrlBase,
    this.liveDomain,
    this.domains,
  });

  App copyWith({
    String? id,
    String? ownerUuid,
    String? defaultIngress,
    DateTime? createdAt,
    DateTime? updatedAt,
    Deployment? activeDeployment,
    Deployment? pendingDeployment,
    Map<String, dynamic>? progress,
    DateTime? lastDeploymentCreatedAt,
    String? liveUrl,
    Region? region,
    String? tierSlug,
    String? liveUrlBase,
    String? liveDomain,
    List<String>? domains,
  }) {
    return App(
      id: id ?? this.id,
      ownerUuid: ownerUuid ?? this.ownerUuid,
      defaultIngress: defaultIngress ?? this.defaultIngress,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      activeDeployment: activeDeployment ?? this.activeDeployment,
      pendingDeployment: pendingDeployment ?? this.pendingDeployment,
      progress: progress ?? this.progress,
      lastDeploymentCreatedAt:
          lastDeploymentCreatedAt ?? this.lastDeploymentCreatedAt,
      liveUrl: liveUrl ?? this.liveUrl,
      region: region ?? this.region,
      tierSlug: tierSlug ?? this.tierSlug,
      liveUrlBase: liveUrlBase ?? this.liveUrlBase,
      liveDomain: liveDomain ?? this.liveDomain,
      domains: domains ?? this.domains,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner_uuid': ownerUuid,
      'default_ingress': defaultIngress,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'active_deployment': activeDeployment?.toMap(),
      'pending_deployment': pendingDeployment?.toMap(),
      'progress': progress,
      'last_deployment_created_at':
          lastDeploymentCreatedAt?.millisecondsSinceEpoch,
      'live_url': liveUrl,
      'region': region?.toMap(),
      'tier_slug': tierSlug,
      'live_url_base': liveUrlBase,
      'live_domain': liveDomain,
      'domains': domains,
    };
  }

  factory App.fromMap(Map<String, dynamic> map) {
    return App(
      id: map['id'] ?? '',
      ownerUuid: map['owner_uuid'] ?? '',
      defaultIngress: map['default_ingress'],
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
      activeDeployment: map['active_deployment'] != null
          ? Deployment.fromMap(map['active_deployment'])
          : null,
      pendingDeployment: map['pending_deployment'] != null
          ? Deployment.fromMap(map['pending_deployment'])
          : null,
      progress: Map<String, dynamic>.from(map['progress']),
      lastDeploymentCreatedAt: map['last_deployment_created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['last_deployment_created_at'])
          : null,
      liveUrl: map['live_url'],
      region: map['region'] != null ? Region.fromMap(map['region']) : null,
      tierSlug: map['tier_slug'],
      liveUrlBase: map['live_url_base'],
      liveDomain: map['live_domain'],
      domains: List<String>.from(map['domains']),
    );
  }

  String toJson() => json.encode(toMap());

  factory App.fromJson(String source) => App.fromMap(json.decode(source));

  @override
  String toString() {
    return 'App(id: $id, ownerUuid: $ownerUuid, defaultIngress: $defaultIngress, createdAt: $createdAt, updatedAt: $updatedAt, activeDeployment: $activeDeployment, pendingDeployment: $pendingDeployment, progress: $progress, lastDeploymentCreatedAt: $lastDeploymentCreatedAt, liveUrl: $liveUrl, region: $region, tierSlug: $tierSlug, liveUrlBase: $liveUrlBase, liveDomain: $liveDomain, domains: $domains)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other is App &&
        other.id == id &&
        other.ownerUuid == ownerUuid &&
        other.defaultIngress == defaultIngress &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.activeDeployment == activeDeployment &&
        other.pendingDeployment == pendingDeployment &&
        collectionEquals(other.progress, progress) &&
        other.lastDeploymentCreatedAt == lastDeploymentCreatedAt &&
        other.liveUrl == liveUrl &&
        other.region == region &&
        other.tierSlug == tierSlug &&
        other.liveUrlBase == liveUrlBase &&
        other.liveDomain == liveDomain &&
        collectionEquals(other.domains, domains);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ownerUuid.hashCode ^
        defaultIngress.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        activeDeployment.hashCode ^
        pendingDeployment.hashCode ^
        progress.hashCode ^
        lastDeploymentCreatedAt.hashCode ^
        liveUrl.hashCode ^
        region.hashCode ^
        tierSlug.hashCode ^
        liveUrlBase.hashCode ^
        liveDomain.hashCode ^
        domains.hashCode;
  }
}

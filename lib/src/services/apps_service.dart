import 'dart:convert';
import 'package:digitalocean/src/models/app_model.dart';
import 'package:digitalocean/src/models/specs/app_spec.dart';
import 'package:digitalocean/src/services/client_http_service.dart';
import 'package:http/http.dart' as http;

class AppsService extends ClientHttpService {
  AppsService({
    required super.baseUrl,
    required super.endpoint,
    required super.oAuthToken,
  });

  /// List all apps on your account. Information about the current active deployment
  /// as well as any in progress ones will also be included for each app.
  Future<List<App>> list() async {
    return await http.get(Uri.parse('$baseUrl$endpoint'), headers: {
      'content-type': 'application/json',
      'Authorization': 'Bearer $oAuthToken',
    }).then((response) async {
      switch (response.statusCode) {
        case 200:
          List undecodedApps = jsonDecode(response.body)['apps'];
          List<App> apps = [];
          for (var undecodedApp in undecodedApps) {
            apps.add(App.fromMap(undecodedApp));
          }
          return apps;
        default:
          throw Exception(jsonDecode(response.body)['message']);
      }
    });
  }

  /// Create a new app by submitting an app specification [AppSpec]
  Future<App> create(AppSpec appSpec) async {
    return await http
        .post(Uri.parse('$baseUrl$endpoint'),
            headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $oAuthToken',
            },
            body: jsonEncode({"spec": appSpec.toMap()}))
        .then((response) async {
      switch (response.statusCode) {
        case 200:
          return App.fromMap(jsonDecode(response.body)['app']);
        default:
          throw Exception(jsonDecode(response.body)['message']);
      }
    });
  }

  /// Update an existing app by submitting a new app specification [AppSpec]
  /// and its ID [appId]
  Future<App> update(String appId, AppSpec appSpec) async {
    return await http
        .put(Uri.parse('$baseUrl$endpoint/$appId'),
            headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $oAuthToken',
            },
            body: jsonEncode({"spec": appSpec.toMap()}))
        .then((response) async {
      switch (response.statusCode) {
        case 200:
          return App.fromMap(jsonDecode(response.body)['app']);
        default:
          throw Exception(jsonDecode(response.body)['message']);
      }
    });
  }

  /// Delete an app by its ID [appId]
  /// Returns the appId of the deleted app
  Future<String> delete(String appId) async {
    return await http.delete(Uri.parse('$baseUrl$endpoint/$appId'), headers: {
      'content-type': 'application/json',
      'Authorization': 'Bearer $oAuthToken',
    }).then((response) async {
      switch (response.statusCode) {
        case 200:
          return response.body;
        default:
          throw Exception(jsonDecode(response.body)['message']);
      }
    });
  }
}

import 'dart:convert';
import 'package:digitalocean/src/models/app_entity.dart';
import 'package:digitalocean/src/services/client_http_service.dart';
import 'package:http/http.dart' as http;

class AppsService extends ClientHttpService {
  AppsService({
    required super.baseUrl,
    required super.endpoint,
  });

  Future<List<App>> list() async {
    return await http.get(Uri.parse('$baseUrl$endpoint'), headers: {
      'content-type': 'application/json',
      'x-auth-token': oAuthToken ?? '',
    }).then((response) async {
      switch (response.statusCode) {
        case 200:
          List undecodedApps = jsonDecode(response.body)['apps'];
          List<App> apps = [];
          for (var undecodedApp in undecodedApps) {
            apps.add(App.fromJson(undecodedApp));
          }
          return apps;
        default:
          throw Exception(jsonDecode(response.body)['message']);
      }
    });
  }
}
